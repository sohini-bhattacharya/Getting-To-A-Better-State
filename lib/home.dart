import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
                'Welcome\nBack !',
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
                                    onPressed: () {},
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