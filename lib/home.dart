import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final dbHelper = DatabaseHelper.instance;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) => // MaterialApp(
  //   // decoration: BoxDecoration(
  //     theme: ThemeData(
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ElevatedButton.styleFrom(
  //           elevation: 8,
  //           shape: CircleBorder(),
  //           minimumSize: Size.square(80),
  //         ),
  //       ),
  //     ),

    Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(

        children: [
          // Image(
          //     image: AssetImage('assets/login.png'), fit: BoxFit.cover),
          Container(),
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'Welcome\nBack!',
              style: new TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            //style: TextStyle(color: Colors.white, fontSize: 33),
          ),

          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Column(
                  children: [

                    SizedBox.fromSize(
                      size: Size(115, 115), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.grey[700], // button color
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            splashColor: Color(0xff8921aa), // splash color
                            borderRadius: BorderRadius.circular(30),
                            // highlightColor: Color(0xff8921aa) ,
                            onTap:() async {
                              try {
                          await dbHelper.makeManager();
                          await dbHelper.managerTrigger();
                          }
                          catch(e){
                          print(e);
                          }
                          Navigator.pushNamed(context, 'login');
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.person, size: 40.0, color: Colors.white,
                                ),// icon
                                Text("User", style: TextStyle(color:Colors.white)), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 35) , child: SizedBox.fromSize(
                      size: Size(115, 115), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.grey[700], // button color
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            splashColor: Color(0xff8921aa), // splash color
                            borderRadius: BorderRadius.circular(30),
                            // highlightColor: Color(0xff8921aa) ,
                            onTap: () { Navigator.pushNamed(context, 'manager');}, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.supervised_user_circle, size: 40.0, color: Colors.white,
                                ),// icon
                                Text("Company",style: TextStyle(color:Colors.white)), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                    // CircleAvatar(
                    //     radius: 60,
                    //     backgroundColor: Color(0xff4c505b),
                    //     child: ElevatedButton(
                    //         style: ElevatedButton.styleFrom(
                    //           : Colors.black, // Background color
                    //         ),
                    //         // style: ButtonStyle(
                    //         //   foregroundColor: getColor(Colors.white70, Colors.black38),
                    //         //   backgroundColor: getColor(Colors.white30, Color(0xff8921aa)),
                    //         // ),
                    //         child: Icon(
                    //             Icons.person, size: 40.0),
                    //         onPressed: () { Navigator.pushNamed(context, 'login');}
                    //     )),
                  ],
                ),
                // Text(
                //   'Company',
                //   style: TextStyle(
                //       fontSize: 27, fontWeight: FontWeight.w700),
                // ),
                // CircleAvatar(
                //   radius: 60,
                //   backgroundColor: Color(0xff4c505b),
                //   child: IconButton(
                //       iconSize: 40.0,
                //       color: Colors.white,
                //       onPressed: () { Navigator.pushNamed(context, 'manager');},
                //       icon: Icon(
                //         Icons.supervised_user_circle,
                //       )),
                // ),
              ],
            ),
          ),
        ],
      ),

  );
}

