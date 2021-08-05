import 'package:first_flutter_app/API/models/cart_request_model.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:first_flutter_app/API/models/product.dart';
import 'package:first_flutter_app/API/utils/expand_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

import '../CartPage.dart';
import '../Home.dart';

class Annonce extends StatefulWidget {
  @override
  _AnnonceState createState() => _AnnonceState();
  Annonce({Key key, this.product}) : super(key: key);

  Product product;

  CartProducts cartProducts = new CartProducts();
}

class _AnnonceState extends State<Annonce> {
  void initState() {
    super.initState();

    var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    cartItemsList.resetStreams();
    cartItemsList.fetchCartItems();
  }

  //_AnnonceState({Key key, this.data}) : super(key: key);
  Product data;

  bool isFav = false;
  bool isAdd = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          title: Text(this.widget.product.name,
              style: TextStyle(color: Colors.black)),
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
            textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: ListView(
                    children: [
                      Container(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: Carousel(
                              images: [
                                NetworkImage(this.widget.product.images[0].src),
                                NetworkImage(this.widget.product.images[0].src),
                              ],
                              dotSize: 4,
                              indicatorBgPadding: 7,
                              dotBgColor: Colors.transparent,
                              dotIncreasedColor: Colors.teal,
                              dotIncreaseSize: 3,
                            )),
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Html(
                                data: this.widget.product.description,
                                style: {
                                  "div": Style(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    fontSize: FontSize.medium,
                                  ),
                                },
                              ),
                            ),
                            Text(
                                '${this.widget.product.price}' +
                                    (Home.lang_ar ? ' د.م ' : ' DH'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16))
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
                      ),
                    ],
                  ),
                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        isFav
                            ? MaterialButton(
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
                        isAdd
                            ? RaisedButton(
                                color: Colors.redAccent,
                                child: Row(
                                  children: [
                                    Text(
                                      Home.lang_ar
                                          ? 'تصفح السلة'
                                          : 'Voir le panier',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.shopping_cart_outlined,
                                        color: Colors.white)
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CartPage()));
                                  // var cartItemsList = Provider.of<CartProvider>(
                                  //     context,
                                  //     listen: false);
                                  // cartItemsList.resetStreams();
                                  // cartItemsList.fetchCartItems();

                                  // test
                                  // Provider.of<LoderProvider>(context,
                                  //         listen: false)
                                  //     .setLoadingStatus(true);
                                  // var cartProvider = Provider.of<CartProvider>(
                                  //         context,
                                  //         listen: false)
                                  //     .fetchCartItems();

                                  // Provider.of<LoderProvider>(context,
                                  //         listen: false)
                                  //     .setLoadingStatus(false);
                                  // test
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(40.0)))
                            : RaisedButton(
                                color: Colors.teal,
                                child: Row(
                                  children: [
                                    Text(
                                      Home.lang_ar
                                          ? 'اضافة الى سلتي'
                                          : 'Ajouter au panier',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.add_shopping_cart,
                                        color: Colors.white)
                                  ],
                                ),
                                onPressed: () {
                                  Provider.of<LoderProvider>(context,
                                          listen: false)
                                      .setLoadingStatus(true);
                                  var cartProvider = Provider.of<CartProvider>(
                                      context,
                                      listen: false);
                                  this.widget.cartProducts.quantity = 1;
                                  this.widget.cartProducts.productId =
                                      this.widget.product.id;
                                  cartProvider.addToCart(
                                      this.widget.cartProducts, (val) {
                                    Provider.of<LoderProvider>(context,
                                            listen: false)
                                        .setLoadingStatus(false);
                                    print(val);
                                  });
                                  setState(() {
                                    isAdd = true;
                                  });
                                  // // fetch product test
                                  // var cartItemsList = Provider.of<CartProvider>(
                                  //     context,
                                  //     listen: false);
                                  // cartItemsList.resetStreams();
                                  // cartItemsList.fetchCartItems();
                                  // end fetch product test
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(40.0))),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Icon(Icons.question_answer_rounded),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
