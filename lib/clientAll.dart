import 'package:flutter/material.dart';

class clientAll extends StatefulWidget {
  const clientAll({Key? key}) : super(key: key);

  @override
  _clientAllState createState() => _clientAllState();
}

class _clientAllState extends State<clientAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Client All !',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                // children: [
                //   Container(
                //     margin: EdgeInsets.only(left: 35, right: 35),
                children: [Column(
                  children: [
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // children: [
                    Text(
                      'User',
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w700),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(

                          iconSize: 40.0,
                          color: Colors.white,
                          onPressed: () { Navigator.pushNamed(context, 'login');},
                          icon: Icon(
                            Icons.person,
                          )),
                    ),
                    Text(
                      'Company',
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w700),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                          iconSize: 40.0,
                          color: Colors.white,
                          onPressed: () { Navigator.pushNamed(context, 'manager');},
                          icon: Icon(
                            Icons.supervised_user_circle,
                          )),
                    ),

                  ],
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //
                  //
                  //   ],
                  // ),
                  // ],
                )],
                // )

              ),
            ),

          ],
        ),
      ),
    );
  }
}