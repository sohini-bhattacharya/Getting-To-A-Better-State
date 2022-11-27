import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

import 'login.dart';

class Apply extends StatefulWidget {
  const Apply({Key? key}) : super(key: key);

  @override
  _ApplyState createState() => _ApplyState();
}

int amt = 0;
String m_id = "";
String username = "";
TextEditingController usernameController = TextEditingController();
String gender = "";
TextEditingController genderController = TextEditingController();
String age = "";
TextEditingController ageController = TextEditingController();



class _ApplyState extends State<Apply> {
  final dbHelper = DatabaseHelper.instance;


  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  void _approve() async {
    // row to insert
    await dbHelper.approvedOrNot(true);
    print('approved');
  }

  void _cancel() async {
    // row to insert
    await dbHelper.approvedOrNot(false);
    print('cancelled');
  }
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
                'Apply ',
                style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
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
                                    color: Color(0xff8921aa),
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
                                    color: Color(0xff8921aa),
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
                            height: 75,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {

                                  var v = await dbHelper.predictPremium(gender,int.parse(age));

                                  await dbHelper.beginTransaction();
                                  await dbHelper.insertPremium(email, m_id, gender, age, amt);
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>AlertDialog(
                                    title: Text('Hey'),           // To display the title it is optional
                                    content: Text('Do you want to commit your changes'),   // Message which will be pop up on the screen
                                    // Action widget which will provide the user to acknowledge the choice
                                    actions: [
                                      TextButton(                     // FlatButton widget is used to make a text to work like a button

                                        onPressed: () {
                                          _cancel();
                                          Navigator.pop(context, 'Cancel');

                                        },             // function used to perform after pressing the button
                                        child: Text('CANCEL'),
                                      ),
                                      TextButton(

                                        onPressed: () {
                                          _approve();
                                          Navigator.pop(context, 'ACCEPT');
                                        },
                                        child: Text('ACCEPT'),
                                      ),
                                    ],
                                  ));
                                  // await dbHelper.
                                  // Navigator.of(context).pop(); // dismiss dialog
                                  // dialogForApprove();

                                  setState(() {
                                    amt = v;
                                  });
                                  // print(amt.toString());
                                  // m_id = await dbHelper.generateManager(gender);

                                },

                                child: Text(
                                  'Estimate Premium',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 22),
                                ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              side: BorderSide(color: Colors.white)
                                          )
                                      )
                                  )

                              ),

                            TextButton(
                              onPressed: () async {
                              },
                              child: Text("${amt}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffD989B5),
                                    fontSize: 20),
                              ),
                              style: ButtonStyle(),
                            ),
                            ],
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                              onPressed: () async {


                                  await dbHelper.queryRows('a');
                                  await dbHelper.queryRows('l');
                                  Navigator.pushNamed(context, 'userProfile');



                                },

                                child: Text(
                                  'Apply for Premium',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      // color: Color(0xffD989B5),
                                      color: Colors.white,
                                      fontSize: 22),
                                ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              side: BorderSide(color: Color(0xff8921aa))
                                          )
                                      )
                                  )
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
