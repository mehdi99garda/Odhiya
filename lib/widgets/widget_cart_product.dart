import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';

class CartProduct extends StatelessWidget {
  CartProduct({this.data});
  CartItem data;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: makeListTitle(context),
        ));
  }

  ListTile makeListTitle(BuildContext context) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      leading: Container(
          width: 50,
          height: 150,
          alignment: Alignment.center,
          child: Image.network(
            data.thumbnail,
            height: 200,
          )),
      title: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            data.productName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )));
}
