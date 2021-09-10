

import 'package:bot_sneakers/src/CreditCard/card_details.dart';
import 'package:bot_sneakers/src/Details/profile_details.dart';
import 'package:bot_sneakers/src/Details/task_details.dart';
import 'package:bot_sneakers/src/Details/user_details.dart';
import 'package:bot_sneakers/src/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    routes: {
      
      Country.routeName: (ctx) => Country(),
      TaskDetails.routeName: (ctx) => TaskDetails(),
      UserDetails.routeName: (ctx) => UserDetails(),
      ProfileEdit.routeName: (ctx) => ProfileEdit()
 
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'com.example.bot_sneakers',
        );
  }
}
