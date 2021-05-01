<<<<<<< HEAD
import 'package:first_flutter_app/pages/AddPost.dart';
import 'package:first_flutter_app/pages/ChatPage.dart';
=======
import 'package:first_flutter_app/pages/AddPub/Add_description.dart';
import 'package:first_flutter_app/pages/AddPub/description_detail.dart';
>>>>>>> 37bef64 (product detail integration)
import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/pages/LoginPage.dart';
import 'package:first_flutter_app/pages/MyCart.dart';
import 'package:first_flutter_app/pages/SearchPage.dart';
<<<<<<< HEAD
import 'package:first_flutter_app/pages/compount/Annonce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
=======
import 'package:first_flutter_app/pages/SignupPage.dart';
import 'package:first_flutter_app/pages/categories.dart';
import 'package:first_flutter_app/pages/events.dart';
import 'package:first_flutter_app/pages/loadingpage.dart';
import 'package:first_flutter_app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_flutter_app/pages/compount/Annonce.dart';
>>>>>>> 37bef64 (product detail integration)

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
<<<<<<< HEAD
  String valuechoose = "العربية";
  List languages = ['العربية', 'الفرنسية'];
  String valuecustomer = "شاري";
  List customer = ['شاري', 'بائع']; //تحويل الى
  String test = '0';
  int _value = 1;
  bool isConnected = false;
  int selectedIndex = 0;
  final screen = [Home(), Annonce(), AddPost(), Chat(), SearchPage()];

=======
>>>>>>> 37bef64 (product detail integration)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
<<<<<<< HEAD
          bottomNavigationBar: BottomNavyBar(
            containerHeight: 45,
            selectedIndex: selectedIndex,
            showElevation: false, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              selectedIndex = index;
            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home_rounded),
                title: Text('الرئيسية'),
                activeColor: Colors.teal,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.list_alt_rounded),
                  title: Text('الاعلانات'),
                  activeColor: Colors.teal),
              BottomNavyBarItem(
                  icon: Icon(Icons.camera_alt_outlined),
                  title: Text('اضف اعلان'),
                  activeColor: Colors.teal),
              BottomNavyBarItem(
                  icon: Icon(Icons.question_answer_rounded),
                  title: Text('محادثة'),
                  activeColor: Colors.teal),
              BottomNavyBarItem(
                  icon: Icon(Icons.person_sharp),
                  title: Text('حسابي'),
                  activeColor: Colors.teal),
            ],
          ),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                color: Colors.black.withOpacity(0.4),
                child: ListView(
                  children: [
                    Expanded(
                      flex: 20,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isConnected
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlatButton(
                                        onPressed: () {},
                                        child: Container(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.lightGreen,
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 6),
                                                    Icon(
                                                      Icons.person_sharp,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Container(
                                                width: 150,
                                                child: Text('الاسم',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: 100),
                                      FlatButton(
                                        child: Row(
                                          children: [
                                            Icon(Icons.storefront,
                                                color: Colors.white),
                                            SizedBox(width: 5),
                                            DropdownButton(
                                              dropdownColor:
                                                  Colors.black.withOpacity(0.5),
                                              value: valuecustomer,
                                              items:
                                                  customer.map((valuecustomer) {
                                                return DropdownMenuItem(
                                                    value: valuecustomer,
                                                    child: Text(
                                                      valuecustomer,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ));
                                              }).toList(),
                                              onChanged: (value) {
                                                valuecustomer = value;
                                                setState(() {
                                                  valuecustomer = value;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('MyCart');
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.lightGreen,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 6),
                                              Icon(
                                                Icons.person_sharp,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Text('تسجيل الدخول',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ListTile(
                      title: DropdownButton(
                        dropdownColor: Colors.black.withOpacity(0.5),
                        value: valuechoose,
                        items: languages.map((valuechoose) {
                          return DropdownMenuItem(
                              value: valuechoose,
                              child: Text(
                                valuechoose,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          valuechoose = value;
                          setState(() {
                            valuechoose = value;
                          });
                        },
                      ),
                      leading: Icon(
                        Icons.translate,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('اضف اعلان',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    ListTile(
                      title: Text('مناسبات',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('فئات',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.list_alt,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('اتصل بنا',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('معلومات عنا',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('شروط الاستعمال',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.assignment_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('كيفية الاستعمال',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      leading: Icon(
                        Icons.assignment_turned_in_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    //solution tar9i3ia
                    /*Container(height: 20, color: Colors.white)*/
                  ],
                ),
              ),
              screen[selectedIndex]
            ],
          ),
=======
          body: LoadingPage(),
>>>>>>> 37bef64 (product detail integration)
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
        'annonce': (context) {
          return Annonce();
        },
        'MyCart': (context) {
          return MyCart();
        },
        'Login': (context) {
          return LoginPage();
        },
<<<<<<< HEAD
=======
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
>>>>>>> 37bef64 (product detail integration)
      },
    );
  }
}
