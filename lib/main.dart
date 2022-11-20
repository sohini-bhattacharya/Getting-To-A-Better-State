import 'package:flutter/material.dart';
import 'package:dbms/login.dart';
import 'package:dbms/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      // 'user': (context) => User(),
    },
  ));
}