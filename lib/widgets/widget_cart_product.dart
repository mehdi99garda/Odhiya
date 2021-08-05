import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  static double somme = 0;
  CartProduct({this.data});
  CartItem data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: makeListTitle(context),
      ),
    );
  }

  Widget makeListTitle(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 80,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: Home.lang_ar
                  ? BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))
                  : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(data.thumbnail),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(data.productName),
              Text(data.productRegularPrice,
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
          color: Colors.white,
          child: Icon(
            Icons.delete_forever,
            color: Colors.teal,
            size: 30,
          ),
          shape: CircleBorder(),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                      title: Text(Home.lang_ar
                          ? "إزالة من سلتي ؟"
                          : "supprimer de votre panier?"),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(Home.lang_ar ? 'لا' : 'Non',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue))),
                        FlatButton(
                            onPressed: () {
                              Provider.of<LoderProvider>(context, listen: false)
                                  .setLoadingStatus(true);
                              var cartProvider = Provider.of<CartProvider>(
                                      context,
                                      listen: false)
                                  .removeItem(data.productId);

                              Provider.of<LoderProvider>(context, listen: false)
                                  .setLoadingStatus(false);
                              // //update
                              Provider.of<CartProvider>(context, listen: false)
                                  .updateCart((val) {
                                Provider.of<LoderProvider>(context,
                                        listen: false)
                                    .setLoadingStatus(false);
                              });

                              // end update
                              Navigator.of(context).pop();
                            },
                            child: Text(Home.lang_ar ? 'نعم' : 'Oui',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue))),
                      ],
                    ));
          },
        ),
      ],
    ));
  }
  //  void Somme() {
  //   somme = double.parse(data.totalA);
  // }
}
