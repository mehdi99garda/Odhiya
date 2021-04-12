import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Annonce extends StatefulWidget {
  @override
  _AnnonceState createState() => _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          title: Text('title', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.teal,
                    child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Carousel(
                          images: [
                            AssetImage('images/cow1.jpg'),
                            AssetImage('images/mouton1.jpg'),
                            AssetImage('images/mouton2.jpg')
                          ],
                          dotSize: 4,
                          indicatorBgPadding: 7,
                          dotBgColor: Colors.transparent,
                          dotIncreasedColor: Colors.teal,
                          dotIncreaseSize: 3,
                        )),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              //border: Border.all(color: Colors.green),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 230,
                                child: Text('وصف description'),
                              ),
                              Text('الثمن',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
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
                                        width: 150,
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
                              Text('Bio')
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isFav
                          ? MaterialButton(
                              minWidth: 20,
                              color: Colors.grey[150],
                              textColor: Colors.redAccent,
                              child: Icon(Icons.favorite),
                              shape: CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  isFav = false;
                                });
                              },
                            )
                          : MaterialButton(
                              minWidth: 20,
                              color: Colors.grey[150],
                              textColor: Colors.redAccent,
                              child: Icon(Icons.favorite_border),
                              shape: CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  isFav = true;
                                });
                              },
                            ),
                      RaisedButton(
                          color: Colors.teal,
                          child: Row(
                            children: [
                              Text(
                                'اضافة الى سلتي',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add_shopping_cart, color: Colors.white)
                            ],
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0))),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {},
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(Icons.question_answer_rounded),
                        shape: CircleBorder(),
                      ),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {},
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(Icons.call),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
