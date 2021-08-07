import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:first_flutter_app/pages/AddPub/Add_images.dart';
import 'package:first_flutter_app/pages/accueil.dart';
import 'package:first_flutter_app/pages/categories.dart';
import 'package:first_flutter_app/pages/login.dart';
import 'package:first_flutter_app/pages/myaccount.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'CartPage.dart';
import 'ChatPage.dart';

class Home extends StatefulWidget {
  static bool isConnected = false;
  static bool lang_ar = true;
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  //
  @override
  void initState() {
    super.initState();

    // var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    // cartItemsList.resetStreams();
    // cartItemsList.fetchCartItems();
  }

  //
  int selectedIndex = 0;
  final screen = [Accueil(), Categories(), AddImages(), Chat(), MyAccount()];

  int countCart = 0;

  List languages = ['العربية / Arabe', 'الفرنسية / Français'];
  String valuecustomer = "شاري";
  List customer = ['شاري', 'بائع'];

  List Menu_ar = [
    'تسجيل الدخول',
    'اضف اعلان',
    'مناسبات',
    'فئات',
    'اتصل بنا',
    'معلومات عنا',
    'شروط الاستعمال',
    'كيفية الاستعمال'
  ];
  List Menu_fr = [
    'Se Connecter',
    'Ajouter Annonce',
    'Événements',
    'Catégories',
    'Contactez-nous',
    'À propos de nous',
    "Conditions d'utilisation",
    'Comment utiliser'
  ];
  List Menu;

  List bottomlist_ar = [
    'الرئيسية',
    'الاعلانات',
    'اضف اعلان',
    'محادثة',
    'حسابي'
  ];
  List bottomlist_fr = [
    'Accueil',
    'Publicités',
    'Ajouter Annonce',
    'discussion',
    'Mon Compte'
  ];
  List bottomlist;

  @override
  Widget build(BuildContext context) {
    Home.lang_ar ? Menu = Menu_ar : Menu = Menu_fr;
    Home.lang_ar ? bottomlist = bottomlist_ar : bottomlist = bottomlist_fr;
    return Directionality(
        textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          drawer: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Drawer(
              child: ListView(
                children: [
                  Container(
                    color: Colors.grey[100],
                    margin: EdgeInsets.only(top: 5),
                    height: 100,
                    child: Image.asset('images/logo_odhiya.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Home.isConnected
                            ? Column(
                                children: [
                                  FlatButton(
                                    onPressed: () {},
                                    child: Container(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.teal,
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
                                            width: 100,
                                            child: Text('الاسم',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
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
                                            color: Colors.black),
                                        SizedBox(width: 5),
                                        DropdownButton(
                                          dropdownColor: Colors.white,
                                          value: valuecustomer,
                                          items: customer.map((valuecustomer) {
                                            return DropdownMenuItem(
                                                value: valuecustomer,
                                                child: Text(
                                                  valuecustomer,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
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
                                  ),
                                ],
                              )
                            : FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pushNamed('login');
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.person_sharp),
                                    SizedBox(width: 30),
                                    Text(Menu[0],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(Menu[1], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.camera_alt_outlined),
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(Menu[2], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.calendar_today_outlined),
                    onTap: () {
                      Navigator.of(context).pushNamed('events');
                    },
                  ),
                  ListTile(
                    title: Text(Menu[3], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.list_alt),
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  ListTile(
                    title: !Home.lang_ar
                        ? Text('Arabe / العربية',
                            style: TextStyle(fontSize: 15))
                        : Text('الفرنسية / Français',
                            style: TextStyle(fontSize: 15)),
                    leading: Icon(Icons.flag_outlined),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Home.lang_ar
                                    ? Text('انت الآن على وشك تغيير لغة التطبيق')
                                    : Text(
                                        "changer la langue de l'application"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          if (Home.lang_ar) {
                                            Home.lang_ar = false;
                                          } else {
                                            Home.lang_ar = true;
                                          }
                                        });
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        super.widget));
                                      },
                                      child: !Home.lang_ar
                                          ? Text('Oui')
                                          : Text('موافق')),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: !Home.lang_ar
                                          ? Text('fermer')
                                          : Text('الغاء'))
                                ],
                              ));
                    },
                  ),
                  ListTile(
                    title: Text(Menu[4], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.call),
                    onTap: () {
                      Navigator.pushNamed(context, 'contact_us');
                    },
                  ),
                  ListTile(
                    title: Text(Menu[5], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.info_outline),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(Menu[6], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.assignment_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(Menu[7], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.assignment_turned_in_outlined),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          appBar: selectedIndex != 4 && selectedIndex != 3
              ? AppBar(
                  leading: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.black),
                    );
                  }),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 40,
                  title: Image(
                      image: AssetImage('images/logo_odhiya.png'), height: 100),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: Icon(Icons.search, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pushNamed('searchpage');
                        }),
                    Stack(
                      children: [
                        // Button MON PANIER
                        IconButton(
                            icon:
                                Icon(Icons.shopping_cart, color: Colors.black),
                            onPressed: () {
                              if (Login.condition == true) {
                                Navigator.of(context).pushNamed('cart_page');
                                // setState(() {
                                var cartItemsList = Provider.of<CartProvider>(
                                    context,
                                    listen: false);
                                cartItemsList.resetStreams();
                                cartItemsList.fetchCartItems();
                              } else {
                                Navigator.of(context).pushNamed('login');
                              }
                              //  });
                            }),
                        // end button mon panier
                        Positioned(
                            top: 0,
                            right: 6,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Text(
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .cartItems
                                      .length
                                      .toString(),
                                  style: TextStyle(color: Colors.white)),
                            ))
                      ],
                    ),
                  ],
                )
              : AppBar(toolbarHeight: 0, backgroundColor: Colors.white),
          body: screen[selectedIndex],
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
                title: Text(bottomlist[0]),
                activeColor: Colors.teal,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.list_alt_rounded),
                  title: Text(bottomlist[1]),
                  activeColor: Colors.teal),
              BottomNavyBarItem(
                  icon: Icon(Icons.camera_alt_outlined),
                  title: Text(bottomlist[2]),
                  activeColor: Colors.teal),
              BottomNavyBarItem(
                  icon: Icon(Icons.question_answer_rounded),
                  title: Text(bottomlist[3]),
                  activeColor: Colors.teal),
              BottomNavyBarItem(
                  icon: Icon(Icons.person_sharp),
                  title: Text(bottomlist[4]),
                  activeColor: Colors.teal),
            ],
          ),
        ));
  }
}
