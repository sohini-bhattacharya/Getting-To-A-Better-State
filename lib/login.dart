import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dbms/database_helper.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:developer' as developer;

String email = "";
var list = [];

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}
class _MyLoginState extends State<MyLogin> {
  final dbHelper = DatabaseHelper.instance;


  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  String password = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool pass = false;

  Future<bool> check(email,password) async {

    dbHelper.table='r';
    dbHelper.databaseName='test';
    String b = await dbHelper.checkLogin('r',email);
    // dbHelper.ageTrigger();
    print("we have b");
    print(b);

    // await dbHelper.managerTrigger();

    // print("this is l table");
    await dbHelper.queryRows('r');


    // await dbHelper.insertPremium("a", "em1", "male", 12, 34);
    // await dbHelper.insertPremium("x", "em2", "female", 14, 3432);
    // await dbHelper.queryRows('r');
    // await dbHelper.joinFunction();


    // await dbHelper.generateManagerFunction();
    // await dbHelper.estimateFunction();
    // await dbHelper.makeManager();
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child:
              Text(
                'Hey! ',
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
                            controller: emailController,
                            onChanged: (v) => setState(() => email=v),
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
                                        await check(email,password);
                                                list = await dbHelper.getAttributes('r',email);

                                                if(pass==true){
                                                  Navigator.pushNamed(context, 'userProfile');
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
                              // CircleAvatar(
                              //   radius: 30,
                              //   backgroundColor: Color(0xff4c505b),
                              //   child: IconButton(
                              //       color: Colors.white,
                              //       onPressed: () async {
                              //         print("here");
                              //
                              //         await check(email,password);
                              //         list = await dbHelper.getAttributes('r',email);
                              //
                              //         if(pass==true){
                              //           Navigator.pushNamed(context, 'userProfile');
                              //         }
                              //         else{
                              //           final snackBar = SnackBar(
                              //             content: const Text('Failure'),);
                              //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              //
                              //         }
                              //       },
                              //       icon: Icon(
                              //         Icons.arrow_forward,
                              //       )),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      color: Color(0xffD989B5),
                                      fontSize: 18),
                                ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              side: BorderSide(color: Color(0xffD989B5))
                                          )
                                      )
                                  )
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
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