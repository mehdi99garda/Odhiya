import 'package:flutter/material.dart';
import 'package:flutter_app_chat/users.dart';
import 'package:flutter_app_chat/users_screen.dart';


import 'home.dart';

void main() => runApp(MyApp());
  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter chat',
      home: UserScreen (),

    );
  }

  }

