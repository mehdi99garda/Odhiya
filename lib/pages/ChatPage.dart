import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  double x = 0;
  double y = 0;
  double scaleFactor = 1;
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isMenuOpen ? 40 : 0)),
          transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                        IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.of(context).pushNamed('home');
                            }),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Continue Chating..',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'اكمل محادثتك...',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
    /*Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text('Continue Chating..'),
        ),
      ),
    );*/
  }
}
