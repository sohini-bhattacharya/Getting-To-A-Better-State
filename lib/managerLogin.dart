import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

class ManagerLogin extends StatefulWidget {
  const ManagerLogin({Key? key}) : super(key: key);

  @override
  _ManagerLoginState createState() => _ManagerLoginState();
}
String email_manager = "";

class _ManagerLoginState extends State<ManagerLogin> {
  final dbHelper = DatabaseHelper.instance;


  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  String password = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController email_managerController = TextEditingController();
  bool pass = false;

  Future<bool> check(email_manager,password) async {
    dbHelper.table='m';
    dbHelper.databaseName='test';
    String b = await dbHelper.checkLogin('m',email_manager);
    print("we have b");
    print(b);
    if(b==password.toString()){
      pass = true;
    }
    else{
      pass = false;
    }

    print("here is pass");
    print(pass);
    return pass;
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child:
              Text(
                'Hey! Manager Login',
                style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: email_managerController,
                            onChanged: (v) => setState(() => email_manager=v),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: passwordController,
                            onChanged: (v) => setState(() => password=v),
                          ),
                          SizedBox(
                            height: 40,
    //

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              SizedBox.fromSize(
                                size: Size(70, 70), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.grey[700], // button color
                                    child: InkWell(
                                      splashFactory: InkRipple.splashFactory,
                                      splashColor: Color(0xff8921aa), // splash color
                                      borderRadius: BorderRadius.circular(30),
                                      // highlightColor: Color(0xff8921aa) ,
                                      onTap:() async {
                                        await dbHelper.queryRows('m');
                                                    await check(email_manager,password);

                                              if(pass==true){
                                                final snackBar = SnackBar(
                                                  content: const Text('Success'),);
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        Navigator.pushNamed(context, 'managerView');
                                        }
                                              else{
                                        final snackBar = SnackBar(
                                        content: const Text('Failure'),);
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                        }
                                        // Navigator.pushNamed(context, 'userProfile');
                                      }, // button pressed
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.arrow_forward, color: Colors.white,
                                          ),// icon
                                          // Text("", style: TextStyle(color:Colors.white)), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}