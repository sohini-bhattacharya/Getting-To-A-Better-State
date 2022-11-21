import 'package:flutter/material.dart';
import 'package:dbms/user.dart';
import 'package:dbms/apply.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: User(),
    routes: {
      'apply': (context) => Apply(),
      // 'user': (context) => User(),
    },
  ));
}