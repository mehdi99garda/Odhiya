import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/pages/payment_sceen.dart';
import 'package:first_flutter_app/pages/shippin_post_page.dart';
import 'package:first_flutter_app/pages/shipping_billing_page.dart';
import 'package:first_flutter_app/widgets/widget_cart_product.dart';
import 'package:first_flutter_app/widgets/widget_payment_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';
import 'package:first_flutter_app/pages/verify_address.dart';

import 'orders_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<CartItem> cartItems;

  @override
  void initState() {
    super.initState();

    var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    cartItemsList.resetStreams();
    cartItemsList.fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoderProvider>(
      builder: (context, loaderModel, child) {
        return Directionality(
          textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            body: ProgressHUD(
              child: _cartItemsList(),
              inAsyncCall: loaderModel.isApiCallProcess,
              opacity: 0.3,
            ),
            bottomNavigationBar: Container(
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
                                style:
                                    TextStyle(fontSize: 15, color: Colors.teal),
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
                            onPressed: () {
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentMethodsScreen()));*/
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));

                              /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VerifyAddressScreen1()));*/
                              /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrdersScreen()));*/
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40.0))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _cartItemsList() {
    return new Consumer<CartProvider>(builder: (context, cartModel, child) {
      return ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartModel.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartProduct(data: cartModel.cartItems[index]);
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
