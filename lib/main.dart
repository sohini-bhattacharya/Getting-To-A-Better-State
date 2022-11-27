import 'package:dbms/managerView.dart';
import 'package:dbms/user.dart';
import 'package:dbms/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:dbms/login.dart';
import 'package:dbms/register.dart';
import 'package:dbms/home.dart';
import 'apply.dart';
import 'checkPremium.dart';
import 'clientAll.dart';
import 'clientYour.dart';
import 'managerLogin.dart';
import 'edit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Apply(),
    routes: {
      'user': (context) => User(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => MyHome(),
      'manager': (context) => ManagerLogin(),
      'managerView': (context) => ManagerView(),
      'apply': (context) => Apply(),
      'userProfile': (context) => UserProfile(),
      'edit': (context) => Edit(),
      'checkPremium': (context) => CheckPremium(),
      'managerView': (context) => ManagerView(),
      'clientAll': (context) => clientAll(),
      'clientYour': (context) => clientYour(),
      // 'approveTransactions': (context) => Approve(),
    },
  )
  );

}