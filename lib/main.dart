import 'package:dbms/user.dart';
import 'package:flutter/material.dart';
import 'package:dbms/login.dart';
import 'package:dbms/register.dart';
import 'package:dbms/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'user': (context) => User(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => MyHome(),
      
    },
  ));
}