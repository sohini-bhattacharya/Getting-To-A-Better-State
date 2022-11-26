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

  @override
  void initState() {
    super.initState();
    // await dbHelper.getAttributes('r',email);
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
        body:

        Stack(


          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 100),
              child: Text(
                'Your Profile',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(child: ListView.builder(
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

            Container(

                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [

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
                                style: ButtonStyle(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
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
                                    style: ButtonStyle(),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
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
                                    style: ButtonStyle(),
                                  ),

                                ],
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



          ],


        ),


      ),
    );
  }
}