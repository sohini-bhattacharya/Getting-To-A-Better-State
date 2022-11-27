// import 'package:flutter/material.dart';
// import 'package:dbms/database_helper.dart';
//
// class Approve extends StatefulWidget {
//   const Approve({Key? key}) : super(key: key);
//
//   @override
//   _ApproveState createState() => _ApproveState();
// }
// String email_manager = "";
//
// class _ApproveState extends State<`Approve> {
//   final dbHelper = DatabaseHelper.instance;
//
//   String password = "";
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController email_managerController = TextEditingController();
//   bool pass = false;
//
//   Future<bool> check(email_manager,password) async {
//     dbHelper.table='m';
//     dbHelper.databaseName='test';
//     String b = await dbHelper.checkLogin('m',email_manager);
//     print("we have b");
//     print(b);
//     if(b==password.toString()){
//       pass = true;
//     }
//     else{
//       pass = false;
//     }
//
//     print("here is pass");
//     print(pass);
//     return pass;
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   image: DecorationImage(
//       //       image: AssetImage('assets/login.png'), fit: BoxFit.cover),
//       // ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(),
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 130),
//               child:
//               Text(
//                 'Hey! Manager Login.',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Username",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             controller: email_managerController,
//                             onChanged: (v) => setState(() => email_manager=v),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Password",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             controller: passwordController,
//                             onChanged: (v) => setState(() => password=v),
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Sign in',
//                                 style: TextStyle(
//                                     fontSize: 27, fontWeight: FontWeight.w700),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: Color(0xff4c505b),
//                                 child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () async {
//                                       await check(email_manager,password);
//
//                                       if(pass==true){
//                                         Navigator.pushNamed(context, 'managerView');
//                                       }
//                                       else{
//                                         final snackBar = SnackBar(
//                                           content: const Text('Failure'),);
//                                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//
//                                       }
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_forward,
//                                     )),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }