import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
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
  }
}
