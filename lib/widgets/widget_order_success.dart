import 'package:first_flutter_app/pages/checkout_base.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

/*import '../../providers/cart_provider.dart';
import '../../screens/home_screen.dart';
import '../checkout/checkout.dart';*/

class OrdersSuccessWidget extends CheckOutBasePage {
  //static const routeName = "/orders-success-screen";

  @override
  _OrdersSuccessWidgetState createState() => _OrdersSuccessWidgetState();
}

class _OrdersSuccessWidgetState
    extends CheckOutBasePageState<OrdersSuccessWidget> {
  @override
  void initState() {
    currentPage = 2;

    //Future.delayed(Duration.zero).then((value) async {
    var orderProvider = Provider.of<CartProvider>(context, listen: false);
    // await
    // orderProvider.createOrder();
    showBackButton = false;
    //});
    super.initState();
  }

  @override
  Widget pageUI() {
    return Consumer<CartProvider>(
      builder: (BuildContext context, orderModel, child) {
        if (orderModel.isOrderCreated) {
          return Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.green.withOpacity(1),
                              Colors.green.withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 90,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      "Your order has been successfully Submitted!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(70, 40),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      /* Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);*/
                    },
                  )
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
