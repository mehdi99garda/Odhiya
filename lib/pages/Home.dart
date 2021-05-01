import 'dart:ui';

<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
=======
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:first_flutter_app/pages/AddPub/Add_images.dart';
import 'package:first_flutter_app/pages/accueil.dart';
import 'package:first_flutter_app/pages/categories.dart';
import 'package:first_flutter_app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'ChatPage.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';

class Home extends StatefulWidget {
  static bool isConnected = false;
>>>>>>> 37bef64 (product detail integration)
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
<<<<<<< HEAD
  double x = 0;
  double y = 0;
  double scaleFactor = 1;
  bool isMenuOpen = false;
  Color colorActive = Color(0xFF4CAF50); //FFFF5252
  Color colorUnactive = Color(0xFF9E9E9E);
  bool isCardApps = true;
  int countCart = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isMenuOpen ? 20 : 0)),
          transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          child: InkWell(
            onTap: () {
              setState(() {
                if (isMenuOpen) {
                  x = 0;
                  y = 0;
                  scaleFactor = 1;
                  isMenuOpen = false;
                }
              });
            },
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isMenuOpen
                          ? IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                setState(() {
                                  x = 0;
                                  y = 0;
                                  scaleFactor = 1;
                                  isMenuOpen = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  x = -75;
                                  y = 120;
                                  scaleFactor = 0.7;
                                  isMenuOpen = true;
                                });
                              }),
                      Column(children: [
                        Image(
                          image: AssetImage('images/logo_odhiya.png'),
                          height: 100,
                        )
                      ]),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                Navigator.of(context).pushNamed('searchpage');
                              }),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('MyCart');
                            },
                            child: Stack(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.shopping_cart),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('MyCart');
                                    }),
                                Positioned(
                                    top: 0,
                                    right: 6,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: Text(countCart.toString(),
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ))
                              ],
                            ),
                          ), /*IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                Navigator.of(context).pushNamed('MyCart');
                              })*/
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  child: ListView(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 5, right: 5, bottom: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('images/slide1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 5, right: 5, bottom: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('images/slide2.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 5, right: 5, bottom: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('images/slide3.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                        options: CarouselOptions(
                          height: 120,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 700),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('اكباش',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListCard('images/mouton2.jpg', 'price'),
                      _buildListCard('images/mouton1.jpg', '900000dh'),
                      _buildListCard('images/mouton2.jpg', 'price'),
                      _buildListCard('images/mouton1.jpg', 'price'),
                      MaterialButton(
                        minWidth: 20,
                        elevation: 0,
                        onPressed: () {},
                        color: Colors.white,
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.teal,
                          size: 30,
                        ),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('ماعز',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListCard('images/chevre2.jpg', 'price'),
                      _buildListCard('images/chevre1.jpg', 'price'),
                      _buildListCard('images/chevre2.jpg', 'price'),
                      _buildListCard('images/chevre1.jpg', 'price'),
                      MaterialButton(
                        minWidth: 20,
                        elevation: 0,
                        onPressed: () {},
                        color: Colors.white,
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.teal,
                          size: 30,
                        ),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('ابقار',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListCard('images/cow1.jpg', 'price'),
                      _buildListCard('images/slide2.jpg', 'price'),
                      _buildListCard('images/cow1.jpg', 'price'),
                      _buildListCard('images/slide2.jpg', 'price'),
                      MaterialButton(
                        minWidth: 20,
                        elevation: 0,
                        onPressed: () {},
                        color: Colors.white,
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.teal,
                          size: 30,
                        ),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildListCard(String imgPath, String price) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('annonce');
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        height: 100,
        child: Stack(
          children: [
            Container(
              height: 90,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                left: 10,
                bottom: 0,
                right: 10,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: 80,
                    height: 25,
                    child: Center(
                        child:
                            Text(price, style: TextStyle(color: Colors.white))),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildCardColumn(String imgPath, String title, String description,
      String price, bool added, bool favorite, context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('annonce');
      },
      child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Ink.image(
                image: AssetImage(imgPath),
                height: 110,
                width: 140,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Row(
                          children: [
                            Icon(Icons.add_shopping_cart, color: Colors.white),
                            Text(
                              'اضافة الى سلتي',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: favorite
                            ? InkWell(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  setState(() {
                                    favorite = false;
                                  });
                                },
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  setState(() {
                                    favorite = true;
                                  });
                                },
                              ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
=======
  int selectedIndex = 0;
  final screen = [Accueil(), Categories(), AddImages(), Chat(), SignupPage()];

  Color colorActive = Color(0xFF4CAF50); //FFFF5252
  Color colorUnactive = Color(0xFF9E9E9E);
  int countCart = 0;

  static String valuechoose = "Arabe / العربية";
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
    'Events',
    'Categories',
    'Call us',
    'About us',
    'Conditions ..',
    'How to use'
  ];
  List Menu;
  List bottomlist_ar = [
    'الرئيسية',
    'الاعلانات',
    'اضف اعلان',
    'محادثة',
    'حسابي'
  ];
  List bottomlist_fr = ['Acceuil', 'Pub', 'Ajouter Pub', 'Chat', 'Mon Compte'];
  List bottomlist;

  @override
  Widget build(BuildContext context) {
    Menu = Menu_ar;
    bottomlist = bottomlist_fr;
    return Directionality(
        textDirection: valuechoose == 'Arabe / العربية'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          drawer: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Drawer(
                child: valuechoose == 'Arabe / العربية'
                    ? ListView(
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
                                                    backgroundColor:
                                                        Colors.teal,
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
                                                    color: Colors.black),
                                                SizedBox(width: 5),
                                                DropdownButton(
                                                  dropdownColor: Colors.white,
                                                  value: valuecustomer,
                                                  items: customer
                                                      .map((valuecustomer) {
                                                    return DropdownMenuItem(
                                                        value: valuecustomer,
                                                        child: Text(
                                                          valuecustomer,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
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
                                          ),
                                        ],
                                      )
                                    : FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            //selectedIndex = 4;
                                            Navigator.of(context)
                                                .pushNamed('login');
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.person_sharp),
                                            SizedBox(width: 30),
                                            Text(Menu_ar[0],
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
                            title: Text(Menu_ar[1],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.camera_alt_outlined),
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                          ),
                          ListTile(
                            title: Text(Menu_ar[2],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.calendar_today_outlined),
                            onTap: () {
                              Navigator.of(context).pushNamed('events');
                            },
                          ),
                          ListTile(
                            title: Text(Menu_ar[3],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.list_alt),
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                          ),
                          ListTile(
                            title: valuechoose == 'الفرنسية / Français'
                                ? Text('Arabe / العربية',
                                    style: TextStyle(fontSize: 15))
                                : Text('الفرنسية / Français',
                                    style: TextStyle(fontSize: 15)),
                            leading: Icon(Icons.flag_outlined),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                        title: Text(
                                            'انت الآن على وشك تغيير لغة التطبيق'),
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('الغاء',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue))),
                                          FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (valuechoose ==
                                                      'الفرنسية / Français') {
                                                    valuechoose =
                                                        'Arabe / العربية';
                                                  } else {
                                                    valuechoose =
                                                        'الفرنسية / Français';
                                                  }
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('موافق',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue)))
                                        ],
                                      ));
                            },
                          ),
                          ListTile(
                            title: Text(Menu_ar[4],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.call),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_ar[5],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.info_outline),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_ar[6],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.assignment_outlined),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_ar[7],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.assignment_turned_in_outlined),
                            onTap: () {},
                          ),
                        ],
                      )
                    : ListView(
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
                                                    backgroundColor:
                                                        Colors.teal,
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
                                                    color: Colors.black),
                                                SizedBox(width: 5),
                                                DropdownButton(
                                                  dropdownColor: Colors.white,
                                                  value: valuecustomer,
                                                  items: customer
                                                      .map((valuecustomer) {
                                                    return DropdownMenuItem(
                                                        value: valuecustomer,
                                                        child: Text(
                                                          valuecustomer,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
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
                                          ),
                                        ],
                                      )
                                    : FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = 4;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.person_sharp),
                                            SizedBox(width: 30),
                                            Text(Menu_fr[0],
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
                            title: Text(Menu_fr[1],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.camera_alt_outlined),
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                          ),
                          ListTile(
                            title: Text(Menu_fr[2],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.calendar_today_outlined),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_fr[3],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.list_alt),
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                          ),
                          ListTile(
                            title: valuechoose == 'الفرنسية / Français'
                                ? Text('Arabe / العربية',
                                    style: TextStyle(fontSize: 15))
                                : Text('الفرنسية / Français',
                                    style: TextStyle(fontSize: 15)),
                            leading: Icon(Icons.flag_outlined),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                        title: Text(
                                            "changer la langue de l'application"),
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Non',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue))),
                                          FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (valuechoose ==
                                                      'الفرنسية / Français') {
                                                    valuechoose =
                                                        'Arabe / العربية';
                                                    Menu = Menu_fr;
                                                  } else {
                                                    valuechoose =
                                                        'الفرنسية / Français';
                                                    Menu = Menu_fr;
                                                  }
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Oui',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue)))
                                        ],
                                      ));
                            },
                          ),
                          ListTile(
                            title: Text(Menu_fr[4],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.call),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_fr[5],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.info_outline),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_fr[6],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.assignment_outlined),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Menu_fr[7],
                                style: TextStyle(fontSize: 16)),
                            leading: Icon(Icons.assignment_turned_in_outlined),
                            onTap: () {},
                          ),
                        ],
                      )
                /*child: ListView(
                children: [
                  valuechoose == 'Arabe / العربية'
                      ? Menu = Menu_ar
                      : Menu = Menu_fr,
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
                        isConnected
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
                                    selectedIndex = 4;
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
                    onTap: () {},
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
                    title: valuechoose == 'الفرنسية / Français'
                        ? Text('Arabe / العربية',
                            style: TextStyle(fontSize: 15))
                        : Text('الفرنسية / Français',
                            style: TextStyle(fontSize: 15)),
                    leading: Icon(Icons.flag_outlined),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title:
                                    Text('انت الآن على وشك تغيير لغة التطبيق'),
                                actions: [
                                  FlatButton(
                                      onPressed: () {}, child: Text('الغاء')),
                                  FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          if (valuechoose ==
                                              'الفرنسية / Français') {
                                            valuechoose = 'Arabe / العربية';
                                            Menu = Menu_ar;
                                          } else {
                                            valuechoose = 'الفرنسية / Français';
                                            Menu = Menu_fr;
                                          }
                                        });
                                      },
                                      child: Text('موافق'))
                                ],
                              ));
                    },
                  ),
                  ListTile(
                    title: Text(Menu[4], style: TextStyle(fontSize: 16)),
                    leading: Icon(Icons.call),
                    onTap: () {},
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
              ),*/
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('MyCart');
                      },
                      child: Stack(
                        children: [
                          IconButton(
                              icon: Icon(Icons.shopping_cart,
                                  color: Colors.black),
                              onPressed: () {
                                Navigator.of(context).pushNamed('MyCart');
                              }),
                          Positioned(
                              top: 0,
                              right: 6,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: Text(countCart.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ))
                        ],
                      ),
                    ),
                  ],
                )
              : AppBar(toolbarHeight: 0),
          body: screen[selectedIndex],
          bottomNavigationBar: valuechoose == 'Arabe / العربية'
              ? BottomNavyBar(
                  containerHeight: 45,
                  selectedIndex: selectedIndex,
                  showElevation: false, // use this to remove appBar's elevation
                  onItemSelected: (index) => setState(() {
                    selectedIndex = index;
                  }),
                  items: [
                    BottomNavyBarItem(
                      icon: Icon(Icons.home_rounded),
                      title: Text(bottomlist_ar[0]),
                      activeColor: Colors.teal,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.list_alt_rounded),
                        title: Text(bottomlist_ar[1]),
                        activeColor: Colors.teal),
                    BottomNavyBarItem(
                        icon: Icon(Icons.camera_alt_outlined),
                        title: Text(bottomlist_ar[2]),
                        activeColor: Colors.teal),
                    BottomNavyBarItem(
                        icon: Icon(Icons.question_answer_rounded),
                        title: Text(bottomlist_ar[3]),
                        activeColor: Colors.teal),
                    BottomNavyBarItem(
                        icon: Icon(Icons.person_sharp),
                        title: Text(bottomlist_ar[4]),
                        activeColor: Colors.teal),
                  ],
                )
              : BottomNavyBar(
                  containerHeight: 45,
                  selectedIndex: selectedIndex,
                  showElevation: false, // use this to remove appBar's elevation
                  onItemSelected: (index) => setState(() {
                    selectedIndex = index;
                  }),
                  items: [
                    BottomNavyBarItem(
                      icon: Icon(Icons.home_rounded),
                      title: Text(bottomlist_fr[0]),
                      activeColor: Colors.teal,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.list_alt_rounded),
                        title: Text(bottomlist_fr[1]),
                        activeColor: Colors.teal),
                    BottomNavyBarItem(
                        icon: Icon(Icons.camera_alt_outlined),
                        title: Text(bottomlist_fr[2]),
                        activeColor: Colors.teal),
                    BottomNavyBarItem(
                        icon: Icon(Icons.question_answer_rounded),
                        title: Text(bottomlist_fr[3]),
                        activeColor: Colors.teal),
                    BottomNavyBarItem(
                        icon: Icon(Icons.person_sharp),
                        title: Text(bottomlist_fr[4]),
                        activeColor: Colors.teal),
                  ],
                ),
        ));
>>>>>>> 37bef64 (product detail integration)
  }
}
