import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

import 'login.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}
String gender = "";
String address = "";
String age = "";
String worksAt = "";


TextEditingController genderController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController worksAtController = TextEditingController();


class _EditState extends State<Edit> {
  final dbHelper = DatabaseHelper.instance;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


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
              padding: EdgeInsets.only(left: 35, top: 100),
              child: Text(
                'Edit Details ',
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
                      //     String gender = "";
                      // String address = "";
                      //     String age = "";
                      //     String worksAt = "";
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 15.0,
                              ),
                              hintText: "Address",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),


                            ),

                            controller: addressController,
                            onChanged: (v) => setState(() => address=v),
                          ),
                          Positioned(
                            bottom: -1,
                            child: Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
                                ),
                              ),
                            ),
                          ),
                            // controller: addressController,
                            // onChanged: (v) => setState(() => address=v),
                          // ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 15.0,
                              ),
                              hintText: "Gender",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),


                            ),

                            controller: genderController,
                            onChanged: (v) => setState(() => gender=v),
                          ),
                          Positioned(
                            bottom: -1,
                            child: Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 15.0,
                              ),
                              hintText: "Age",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),


                            ),

                            controller: ageController,
                            onChanged: (v) => setState(() => age=v),
                          ),
                          Positioned(
                            bottom: -1,
                            child: Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 15.0,
                              ),
                              hintText: "Works At",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),


                            ),

                            controller: worksAtController,
                            onChanged: (v) => setState(() => worksAt=v),
                          ),
                          Positioned(
                            bottom: -1,
                            child: Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {

                                  print("list is here");
                                  print(list);


                                  await dbHelper.editDetails(email,gender,age,address,worksAt);
                                  list = await dbHelper.getAttributes('r',email);

                                  await dbHelper.queryRows('r');


                                  Navigator.pushNamed(context, 'userProfile');
                                },
                                child: Text(
                                  'Save',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 22),
                                ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(27.0),
                                              side: BorderSide(color: Colors.white)
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
      ),),
    );
  }
}