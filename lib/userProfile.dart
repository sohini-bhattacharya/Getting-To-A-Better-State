import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

import 'login.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final dbHelper = DatabaseHelper.instance;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    super.initState();
    // await dbHelper.getAttributes('r',email);
  }

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
           child: Column(
               children: [
           Container(
             alignment: Alignment.topLeft,
           padding: EdgeInsets.only(left: 60 , bottom: 10, top: 50),
           child: Text(
             'Your Profile',
             style: new TextStyle(
                 fontSize: 40.0,
                 fontWeight: FontWeight.bold,
                 foreground: Paint()..shader = linearGradient),
           ),
           ),
          Container( width: MediaQuery.of(context).size.width*0.99,
            height:  MediaQuery.of(context).size.height*0.66,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(list[index],textAlign: TextAlign.left,

                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16),
                  ),
                );
              })),
          // SingleChildScrollView(
          //       child:(ListView.builder(
          //           itemCount: 5,
          //           itemBuilder: (BuildContext context, int index) {
          //             return ListTile(
          //                 leading: const Icon(Icons.list),
          //                 trailing: const Text(
          //                   "GFG",
          //                   style: TextStyle(color: Colors.green, fontSize: 15),
          //                 ),
          //                 title: Text("List item $index"));
          //           })),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: ()  {
                              print("list is here");
                              print(list);
                              // await functionPremium();
                              Navigator.pushNamed(context, 'edit');
                            },
                            child: Text(
                              'Edit',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22.0),
                                          side: BorderSide(color: Color(0xffD989B5))
                                      )
                                  )
                              )
                          ),
                          TextButton(
                            onPressed: () async {
                              // await functionPremium();
                              // Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              'Check Premiums',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22.0),
                                          side: BorderSide(color: Color(0xffD989B5))
                                      )
                                  )
                              )
                          ),
                          TextButton(
                            onPressed: () async {
                              // await functionPremium();
                              Navigator.pushNamed(context, 'apply');
                            },
                            child: Text(
                              'Apply',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22.0),
                                          side: BorderSide(color: Color(0xffD989B5))
                                      )
                                  )
                              )
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                              // TextButton(
                              //   onPressed: () async {
                              //     // await functionPremium();
                              //     // Navigator.pushNamed(context, 'register');
                              //   },
                              //   child: Text(
                              //     'Check Premiums',
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: Colors.white,
                              //         fontSize: 12),
                              //   ),
                              //   style: ButtonStyle(),
                              // ),

                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                              // TextButton(
                              //   onPressed: () async {
                              //     // await functionPremium();
                              //     Navigator.pushNamed(context, 'apply');
                              //   },
                              //   child: Text(
                              //     'Apply',
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: Colors.white,
                              //         fontSize: 12),
                              //   ),
                              //   style: ButtonStyle(),
                              // ),

                            ],
                          ),
                      ),
            ),
          );
    //      ],
    // ),
    // ),
    //     ),);
  }
}