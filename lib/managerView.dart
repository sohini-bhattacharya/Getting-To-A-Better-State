import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dbms/database_helper.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:developer' as developer;

class ManagerView extends StatefulWidget {
  const ManagerView({Key? key}) : super(key: key);

  @override
  _ManagerViewState createState() => _ManagerViewState();
}
class _ManagerViewState extends State<ManagerView> {
  final dbHelper = DatabaseHelper.instance;

  String email = "";
  String password = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool pass = false;

  Future<bool> check(email,password) async {
    dbHelper.table='m';
    dbHelper.databaseName='test';
    String b = await dbHelper.checkLogin(dbHelper.table,email);
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
                'Hey! Manager Login.',
                style: TextStyle(color: Colors.white, fontSize: 33),
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
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      print("here");
                                      // print(check(email,password));
                                      // final res = check(email,password);
                                      // print("res");
                                      // print(res);
                                      await check(email,password);
                                      // print(pass.toString());

                                      if(pass==true){
                                        Navigator.pushNamed(context, 'home');
                                      }
                                      else{
                                        final snackBar = SnackBar(
                                          content: const Text('Failure'),);
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
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