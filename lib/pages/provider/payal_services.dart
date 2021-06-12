import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_flutter_app/API/config.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert' as convert;

import 'cart_provider.dart';
//import 'package:http_auth/http_auth.dart';

class PaypalServices {
  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by paypal
  String clientId = Config.paypalClientID;

  String secret = Config.paypalSecretKey;

  String returnURL = "";
  String cancelURL = "";

  // for getting the access token from Paypal
  Future<String> getAccessToken() async {
    try {
      // var client = BasicAuthClient(clientId, secret);
      var authToken = base64.encode(
        utf8.encode(clientId + ":" + secret),
      );
      var response = await Dio().post(
          '${Config.paypalURL}/v1/oauth2/token?grant_type=client_credentials',
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 200) {
        final body = response.data;
        return body["access_token"];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  Map<String, dynamic> getOrderParams(BuildContext context) {
    var cartModel = Provider.of<CartProvider>(context, listen: false);
    cartModel.fetchCartItems();

    List items = [];
    cartModel.cartItems.forEach((CartItem item) {
      items.add({
        "name": item.productName,
        "quantity": item.qty,
        "price": item.productSalePrice,
        "currency": defaultCurrency["currency"]
      });
    });
    //   {
    //     "name": itemName,
    //     "quantity": quantity,
    //     "price": itemPrice,
    //     "currency": defaultCurrency["currency"]
    //   }
    // ];

    //   // checkout invoice details
    /////// String totalAmount = cartModel.totalAmount.toString();
    ////// String subTotalAmount = cartModel.totalAmount.toString();
    String shippingCost = '0';
    int shippingDiscountCost = 0;

    //   String totalAmount = '1.99';
    //   String subTotalAmount = '1.99';
    //   String shippingCost = '0';
    //   int shippingDiscountCost = 0;
    //   String userFirstName = 'Gulshan';
    //   String userLastName = 'Yadav';
    //   String addressCity = 'Delhi';
    //   String addressStreet = 'Mathura Road';
    //   String addressZipCode = '110014';
    //   String addressCountry = 'India';
    //   String addressState = 'Delhi';
    //   String addressPhoneNumber = '+919990119091';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            //        "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              //         "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            // if (isEnableShipping &&
            //     isEnableAddress)
            //   "shipping_address": {
            //     "recipient_name": userFirstName +
            //         " " +
            //         userLastName,
            //     "line1": addressStreet,
            //     "line2": "",
            //     "city": addressCity,
            //     "country_code": addressCountry,
            //     "postal_code": addressZipCode,
            //     "phone": addressPhoneNumber,
            //     "state": addressState
          },
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>> createPaypalPayment(
      transactions, accessToken) async {
    try {
      var response = await Dio().post("${Config.paypalURL}/v1/payments/payment",
          data: convert.jsonEncode(transactions),
          options: new Options(headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer  $accessToken',
          }));

      final body = convert.jsonDecode(response.data);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        return null;
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String> executePayment(url, payerId, accessToken) async {
    try {
      var response = await Dio().post(url,
          data: convert.jsonEncode({"payer_id": payerId}),
          options: new Options(headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          }));

      final body = convert.jsonDecode(response.data);
      if (response.statusCode == 200) {
        return body["id"];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
