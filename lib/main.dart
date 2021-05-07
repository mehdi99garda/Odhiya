import 'package:first_flutter_app/pages/AddPub/Add_description.dart';
import 'package:first_flutter_app/pages/AddPub/description_detail.dart';
import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/pages/LoginPage.dart';
import 'package:first_flutter_app/pages/MyCart.dart';
import 'package:first_flutter_app/pages/SearchPage.dart';
import 'package:first_flutter_app/pages/SignupPage.dart';
import 'package:first_flutter_app/pages/categories.dart';
import 'package:first_flutter_app/pages/compount/Annonce.dart';
import 'package:first_flutter_app/pages/events.dart';
import 'package:first_flutter_app/pages/loadingpage.dart';
import 'package:first_flutter_app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/pages/base_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoderProvider(),
            child: BasePage(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
            child: Annonce(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: LoadingPage(),
            ),
          ),
          routes: {
            'searchpage': (context) {
              return SearchPage();
            },
            'home': (context) {
              return Home();
            },
            'main': (context) {
              return MyApp();
            },
            'categories': (context) {
              return Categories();
            },
            'annonce': (context) {
              return Annonce();
            },
            'MyCart': (context) {
              return MyCart();
            },
            'Login': (context) {
              return LoginPage();
            },
            'part2_add_ad': (context) {
              return DescriptionAd();
            },
            'part3_add_ad': (context) {
              return Descriptiondetail();
            },
            'events': (context) {
              return Events();
            },
            'signup': (context) {
              return SignupPage();
            },
            'login': (context) {
              return Login();
            },
          },
        ));
  }
}
