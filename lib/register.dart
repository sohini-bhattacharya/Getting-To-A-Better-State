import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';
class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();

}

class _MyRegisterState extends State<MyRegister> {
  final dbHelper = DatabaseHelper.instance;

  // void instantiate() async{
  //   // dbHelper.delimiter();
  //   await dbHelper.ageTrigger();
  // }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  void _insert(name,email,password,address,aadhar,birthdate) async {
    // row to insert
    dbHelper.table='r';
    dbHelper.databaseName='test';


    // await dbHelper.makeManager();
    final id = await dbHelper.insert(name,email,password,address,aadhar,birthdate);
    print('inserted row id: $id');
  }

  void _queryAll() async {
    var e = await dbHelper.queryRows('r');
    print(e);
  }

  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);

    print('deleted $rowsDeleted row(s): row $id');
  }
  
  String name = "";
  String email = "";
  String address = "";
  String password = "";
  String aadhar = "";
  String birthdate = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: SafeArea(child:
          SingleChildScrollView(
          child: Stack(children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Register ',
                style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),

               Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff8921aa),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: nameController,
                            onChanged: (v) => setState(() => name=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff8921aa),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: emailController,
                            onChanged: (v) => setState(() => email=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff8921aa),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Address",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: addressController,
                            onChanged: (v) => setState(() => address=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff8921aa),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Birthdate",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: birthdateController,
                            onChanged: (v) => setState(() => birthdate=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff8921aa),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Aadhar",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: aadharController,
                            onChanged: (v) => setState(() => aadhar=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff8921aa),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: passwordController,
                            onChanged: (v) => setState(() => password=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox.fromSize(
                                size: Size(65, 65), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.grey[700], // button color
                                    child: InkWell(
                                      splashFactory: InkRipple.splashFactory,
                                      splashColor: Color(0xff8921aa), // splash color
                                      borderRadius: BorderRadius.circular(50),
                                      // highlightColor: Color(0xff8921aa) ,
                                      onTap:() async {
                                        _insert(name,email,password,address,aadhar,birthdate);
                                                    _queryAll();
                                        //
                                                    final snackBar = SnackBar(
                                                      content: const Text('Success'),);
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                    Navigator.pushNamed(context, 'login');
                                        // Navigator.pushNamed(context, 'userProfile');
                                      }, // button pressed
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.arrow_forward, color: Colors.white,
                                          ),// icon
                                          // Text("Sign Up", style: TextStyle(color:Colors.white)), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          //     CircleAvatar(
                          //       radius: 30,
                          //       backgroundColor: Color(0xff4c505b),
                          //       child: IconButton(
                          //           color: Colors.white,
                          //           onPressed: () {
                          //             // instantiate();
                          //             _insert(name,email,password,address,aadhar,birthdate);
                          //             //_delete(1);
                          //             //_delete(2);
                          //             //_delete(3);
                          //
                          //             _queryAll();
                          //
                          //             final snackBar = SnackBar(
                          //               content: const Text('Success'),);
                          //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          //             Navigator.pushNamed(context, 'login');
                          //           },
                          //
                          //           icon: Icon(
                          //             Icons.arrow_forward,
                          //           )),
                          //     )
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
      ],)),
       ),
            );
  }
}