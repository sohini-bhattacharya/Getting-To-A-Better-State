import 'package:dbms/login.dart';
import 'package:flutter/material.dart';
import 'package:dbms/user.dart';
import 'package:dbms/apply.dart';
import 'package:dbms/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyRegister(),
    routes: {
      'apply': (context) => Apply(),
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),

      // 'user': (context) => User(),
    },
  ));
}