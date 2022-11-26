import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

import 'login.dart';

class CheckPremium extends StatefulWidget {
  const CheckPremium({Key? key}) : super(key: key);

  @override
  _CheckPremiumState createState() => _CheckPremiumState();
}

String amt = "";
String m_id = "";
String username = "";
TextEditingController usernameController = TextEditingController();
String gender = "";
TextEditingController genderController = TextEditingController();
String age = "";
TextEditingController ageController = TextEditingController();

class _CheckPremiumState extends State<CheckPremium> {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 100),
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
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
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Gender",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: genderController,
                            onChanged: (v) => setState(() => gender=v),
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
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Age",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: ageController,
                            onChanged: (v) => setState(() => age=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {


                                  amt="hello";
                                  // amt = await dbHelper.estimatePremium(username,gender,age);
                                  // m_id = await dbHelper.generateManager(gender);

                                },
                                child: Text(
                                  'Estimate Premium',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 22),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                onPressed: () async {

                                },
                                child: Text("$num",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                style: ButtonStyle(),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  await dbHelper.insertPremium(email, m_id, gender, age, amt);
                                  Navigator.pushNamed(context, 'checkPremium');

                                },
                                child: Text(
                                  'Apply for Premium',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 22),
                                ),
                                style: ButtonStyle(),
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