import 'package:dbms/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

import 'login.dart';
import 'managerLogin.dart';

class clientAll extends StatefulWidget {
  const clientAll({Key? key}) : super(key: key);

  @override
  _clientAllState createState() => _clientAllState();
}

class _clientAllState extends State<clientAll> {
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
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 60 , bottom: 10, top: 50),
              child: Text(
                'All Company Clients: ',
                style: new TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            Container( width: MediaQuery.of(context).size.width*0.99,
                height:  MediaQuery.of(context).size.height*0.66,
                child: ListView.builder(
                    itemCount: clientListAll.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0,),

                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(width: 1.0, color: Colors.purpleAccent))),
                          child: Icon(Icons.circle, color: Colors.white,size:15),
                        ),
                        title: Text(clientListAll[index],textAlign: TextAlign.left,

                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      );
                    })),

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