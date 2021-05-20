import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/widgets/widget_cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';

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
        return Scaffold(
            body: ProgressHUD(
          child: _cartItemsList(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,
        ));
      },
    );
  }

  Widget _cartItemsList() {
    return new Consumer<CartProvider>(builder: (context, cartModel, child) {
      if (cartModel.cartItems != null && cartModel.cartItems.length > 0) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
        );
      }
    });
  }
}
