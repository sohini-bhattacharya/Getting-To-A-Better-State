import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';
import 'managerLogin.dart';
import 'login.dart';

List clientListAll = [];
List clientList = [];

class ManagerView extends StatefulWidget {
  const ManagerView({Key? key}) : super(key: key);

  @override
  _ManagerViewState createState() => _ManagerViewState();
}
String gender = "";
String address = "";
String age = "";
String worksAt = "";



TextEditingController genderController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController worksAtController = TextEditingController();


class _ManagerViewState extends State<ManagerView> {
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
                'Check Client Status',
                style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, top: 50),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {

                                  print("your list is here");

                                  clientList = await dbHelper.joinSpecificFunction(email_manager);

                                  print(clientList);

                                  await dbHelper.queryRows('l');


                                  Navigator.pushNamed(context, 'clientYour');
                                },
                                child: Text(
                                  'See Your Clients',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {

                                  print("all list is here");

                                  clientListAll = await dbHelper.joinFunction();
                                  print(clientListAll);

                                  await dbHelper.queryRows('l');

                                  Navigator.pushNamed(context, 'clientAll');
                                },
                                child: Text(
                                  'See All Clients',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
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