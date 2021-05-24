import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/widgets/widget_home_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/config.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Container(
          height: 120,
          child: ListView(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('images/slide1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('images/slide2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 3),
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
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            Home.lang_ar ? 'خروف' : 'Moutons',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: WidgetHomeProducts(
            tagId: Config.mouton,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            Home.lang_ar ? 'الماعز' : 'Chevres',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: WidgetHomeProducts(
            tagId: Config.chevre_fr,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            Home.lang_ar ? 'أبقار' : 'Vaches',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: WidgetHomeProducts(tagId: Config.vache),
        )
      ],
    );
  }
/*
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
  }*/
}
