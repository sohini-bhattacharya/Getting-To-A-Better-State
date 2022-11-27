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

                                  amt = await dbHelper.predictPremium(gender,int.parse(age));
                                  await dbHelper.beginTransaction();
                                  await dbHelper.insertPremium(email, m_id, gender, age, amt);
                                  // await dbHelper.
                                  // Navigator.of(context).pop(); // dismiss dialog
                                  // dialogForApprove();

                                  // print(amt.toString());
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
                              child: Text("${amt}",
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
                              // bool result = await showDialog(
                              // context: context,
                              // builder: (context) {
            //                     return AlertDialog(
            //                     title: Text('Confirmation'),
            //                     content: Text('Do you want to commit?'),
            //                       actions: <Widget>[
            //                               FlatButton(
            //                             onPressed: () {
            //                                 Navigator.of(context, rootNavigator: true).pop(false);},
            //                                   child: Text('No'),
            //                               ),
            //                               FlatButton(
            //                             onPressed: () {
            //                               Navigator.of(context, rootNavigator: true).pop(true);},
            //                                   child: Text('Yes'),),],);
            //                   }},
            //                       );
            //                   if (result) {
            //                     if (missingvalue) {
            //                       Scaffold.of(context).showSnackBar(new SnackBar(
            //                         content: new Text('Missing Value'),));
            //                     } else {
            //                       saveObject();
            //                       Navigator.of(context).pop(_myObject); // dismisses the entire widget
            //                       // }} else {
            // Navigator.of(context).pop(_myObject); // dismisses the entire widget
            // }
            // }

                                  await dbHelper.queryRows('a');
                                  await dbHelper.queryRows('l');
                                  Navigator.pushNamed(context, 'userProfile');
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