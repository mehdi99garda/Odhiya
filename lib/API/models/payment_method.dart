import 'package:first_flutter_app/pages/paypal_payment.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../providers/cart_provider.dart';
import 'order.dart';

class PaymentMethod {
  String id;
  String name;
  String description;
  String logo;
  String route;
  Function onTap;
  bool isRouteRedirect = false;

  PaymentMethod({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.route,
    this.onTap,
    this.isRouteRedirect,
  });

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    logo = json['logo'];
    route = json['sale_price'];
    route = json['onTap'];
    isRouteRedirect = json['isRouteRedirect'];
  }
}

class PaymentMethodsList {
  List<PaymentMethod> _paymentList = [];
  List<PaymentMethod> _cashList = [];

  PaymentMethodsList(BuildContext context) {
    this._paymentList = [
      PaymentMethod(
        id: "paypal",
        name: "paypal",
        description: "Click to pay with Paypal Method",
        logo: "assets/img/paypal.png",
        route: "/OrderSuccess",
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder:
                      (context) => /*PaymentMethodsScreen*/ PaypalPayment()));
          //async {
          // //create order;
          // var ordersModel = OrdersModel();
          // //   ordersModel.paymentMethod = "cod";
          // //  ordersModel.paymentMethodTitle = "Cash On Delivery";
          // //  ordersModel.setPaid = false;

          // //prep for submission
          // var cartProvider = Provider.of<CartProvider>(context, listen: false);
          // await cartProvider.processOrder(ordersModel);
          // //submission is handled in OrderSuccessWidget()
        },
        isRouteRedirect: false,
      ),
    ];

    this._cashList = [
      PaymentMethod(
        id: "cod",
        name: "Cash On Delivery",
        description: "Click to pay with Cash On Delivery",
        logo: "assets/img/paypal.png",
        route: "/OrderSuccess",
        /*   onTap: () async {
          //create order;
          var ordersModel = OrdersModel();
          //   ordersModel.paymentMethod = "cod";
          //  ordersModel.paymentMethodTitle = "Cash On Delivery";
          //  ordersModel.setPaid = false;

          //prep for submission
          var cartProvider = Provider.of<CartProvider>(context, listen: false);
          await cartProvider.processOrder(ordersModel);
          //submission is handled in OrderSuccessWidget()
        },*/
        isRouteRedirect: false,
      ),
    ];
  }

  List<PaymentMethod> get paymentList => _paymentList;
  List<PaymentMethod> get cashList => _cashList;
}
