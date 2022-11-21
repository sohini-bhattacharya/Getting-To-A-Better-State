import 'package:flutter/material.dart';
import 'package:dbms/user.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: User(),
    routes: {

      // 'user': (context) => User(),
    },
  ));
}