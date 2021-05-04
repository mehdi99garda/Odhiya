import 'package:first_flutter_app/API/models/product.dart';
import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/pages/compount/Annonce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  MyCart({Key key, this.product1}) : super(key: key);

  Product product1;
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool isCartEmpty = false;
  int nbr_item_cart = 4;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 30,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
                padding: EdgeInsets.all(5),
                child: isCartEmpty
                    ? Container(
                        child: Center(
                          child: Column(
                            children: [
                              Icon(Icons.shopping_basket_outlined, size: 50),
                              Text('سلتك فارغة',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    : ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'سلتي(' + nbr_item_cart.toString() + ')',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          _buildCardCart(
                              this.widget.product1.images[0].src,
                              this.widget.product1.name,
                              this.widget.product1.price),
                          /*  _buildCardCart(
                              'images/chevre1.jpg', 'title', '3000dh'),
                          _buildCardCart(
                              'images/mouton1.jpg', 'title', '3000dh'),
                          _buildCardCart(
                              'images/mouton2.jpg', 'title', '3000dh'),*/
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'مقترحات عليك',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildListCard('images/slide1.png', 'price'),
                                _buildListCard('images/slide3.jpg', 'price'),
                                _buildListCard('images/chevre2.jpg', 'price'),
                                _buildListCard('images/mouton2.jpg', 'price'),
                              ],
                            ),
                          )
                        ],
                      )),
            bottomNavigationBar: !isCartEmpty
                ? Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    height: 70,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.green.withOpacity(0.5),
                          height: 5,
                          thickness: 2,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'المجموع : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '12000 ' + 'د.م',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.teal),
                                    )
                                  ],
                                ),
                              ),
                              RaisedButton(
                                  color: Colors.teal,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Check out',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(40.0))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Text('')),
      ),
    );
  }

  Widget _buildCardCart(String imgPath, String title, String price) {
    return InkWell(
      onTap: () {
        //Navigator.of(context).pushNamed('annonce');
      },
      child: Container(
          margin: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
              color: Colors.white,
              //border: Border.all(color: Colors.green),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                width: 150,
                child: Column(
                  children: [
                    Text(title),
                    Text(price,
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                elevation: 0,
                onPressed: () {},
                color: Colors.white,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.teal,
                  size: 30,
                ),
                shape: CircleBorder(),
              ),
            ],
          )),
    );
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
                  image: NetworkImage(imgPath),
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
}
