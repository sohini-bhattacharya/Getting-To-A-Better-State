import 'package:dbms/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';

import 'login.dart';

class CheckPremium extends StatefulWidget {
  const CheckPremium({Key? key}) : super(key: key);

  @override
  _CheckPremiumState createState() => _CheckPremiumState();
}

class _CheckPremiumState extends State<CheckPremium> {
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
                  'Previous Transactions',
                style: new TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            Container( width: MediaQuery.of(context).size.width*0.99,
                height:  MediaQuery.of(context).size.height*0.66,
                child: ListView.builder(
                    itemCount: preList.length,
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
                        title: Text(preList[index],textAlign: TextAlign.left,

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox.fromSize(
            //       size: Size(65, 65), // button width and height
            //       child: ClipOval(
            //         child: Material(
            //           color: Colors.grey[700], // button color
            //           child: InkWell(
            //             splashFactory: InkRipple.splashFactory,
            //             splashColor: Color(0xff8921aa), // splash color
            //             borderRadius: BorderRadius.circular(50),
            //             // highlightColor: Color(0xff8921aa) ,
            //             onTap:() {
            //               // _insert(name,email,password,address,aadhar,birthdate);
            //               // _queryAll();
            //               //
            //
            //               Navigator.of(context).pop();
            //               // Navigator.pushNamed(context, 'userProfile');
            //             }, // button pressed
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 Icon(Icons.arrow_back, color: Colors.white,
            //                 ),// icon
            //                 // Text("Sign Up", style: TextStyle(color:Colors.white)), // text
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     //     CircleAvatar(
            //     //       radius: 30,
            //     //       backgroundColor: Color(0xff4c505b),
            //     //       child: IconButton(
            //     //           color: Colors.white,
            //     //           onPressed: () {
            //     //             // instantiate();
            //     //             _insert(name,email,password,address,aadhar,birthdate);
            //     //             //_delete(1);
            //     //             //_delete(2);
            //     //             //_delete(3);
            //     //
            //     //             _queryAll();
            //     //
            //     //             final snackBar = SnackBar(
            //     //               content: const Text('Success'),);
            //     //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //     //             Navigator.pushNamed(context, 'login');
            //     //           },
            //     //
            //     //           icon: Icon(
            //     //             Icons.arrow_forward,
            //     //           )),
            //     //     )
            //   ],
            // ),
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