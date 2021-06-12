import 'dart:async';
import 'dart:convert';

import 'package:first_flutter_app/API/models/customer_detail_model.dart';
import 'package:first_flutter_app/API/models/order.dart';
import 'package:first_flutter_app/API/models/shipping.dart';
import 'package:first_flutter_app/API/utils/form_helper.dart';
import 'package:first_flutter_app/pages/payment_sceen.dart';
import 'package:first_flutter_app/pages/paypal_payment.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/widgets/widget_order_success.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:first_flutter_app/API/api_service.dart';

import 'dart:developer';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  APIService _apiService = new APIService();
  final TextEditingController _controller = TextEditingController();
  //Future<CustomerDetailsModel> _model;
  CustomerDetailsModel _model = new CustomerDetailsModel();
  OrdersModel _ordersModel = new OrdersModel();
  ShippingModel ship = new ShippingModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          //_model = _apiService.ship(model);
          child: /*(_model == null) */ buildColumn(), //: buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter first name'),
          onChanged: (value) {
            setState(() {
              ship.firstName = value;
            });
          },
        ),
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter last name'),
          onChanged: (value) {
            setState(() {
              ship.lastName = value;
            });
          },
        ),
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter adresse '),
          onChanged: (value) {
            setState(() {
              ship.address1 = value;
            });
          },
        ),
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter city'),
          onChanged: (value) {
            setState(() {
              ship.city = value;
            });
          },
        ),
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter last name'),
          onChanged: (value) {
            setState(() {
              ship.country = value;
            });
          },
        ),
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter last name'),
          onChanged: (value) {
            setState(() {
              ship.postCode = value;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            //  _ordersModel.customerId = 15;
            _ordersModel.shipping = ship;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PaymentMethodsScreen() /* PaypalPayment()*/));
            //_apiService.createOrder(_ordersModel);
            /* Navigator.push(con
           text,
                MaterialPageRoute(builder: (context) => OrdersSuccessWidget()));
            var orderProvider =
                Provider.of<CartProvider>(context, listen: false);
            orderProvider.createOrder(ship);*/
            // await

            // log('data: $_ordersModel');
            /*  setState(() {
              //  _apiService.ship(this.);
              _apiService.ship(_model);
            });*/
          },
          child: Text('Create Data'),
        ),
      ],
    );
  }

  /*FutureBuilder<CustomerDetailsModel> buildFutureBuilder() {
    return FutureBuilder<CustomerDetailsModel>(
      future: _model,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.firstName);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }*/

  /* Widget pageUi(CustomerDetailsModel _model) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("First Name"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("Last Name"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.textInput(
                          context,
                          _model.shipping.firstName,
                          (value) => {
                            _model.shipping.firstName = value,
                          },
                          onValidate: (value) {
                            if (value.toString().isEmpty) {
                              return "please enter last Name";
                            }
                            return null;
                          },
                        ),
                        //child: FormHelper.fieldLabelValue(context, ""),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.textInput(
                          context,
                          _model.shipping.lastName,
                          (value) => {
                            _model.shipping.lastName = value,
                          },
                          onValidate: (value) {
                            if (value.toString().isEmpty) {
                              return "please enter last Name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                FormHelper.fieldLabel("Address"),
                FormHelper.textInput(
                  context,
                  _model.shipping.address1,
                  (value) => {
                    _model.shipping.address1 = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return "please enter last Name";
                    }
                    return null;
                  },
                ),
                //FormHelper.fieldLabel("Apartment, Suite, etc."),
                //FormHelper.fieldLabelValue(context, _model.shipping.address2),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("Country"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("State"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.textInput(
                        context,
                        _model.shipping.country,
                        (value) => {
                          _model.shipping.country = value,
                        },
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "please enter last Name";
                          }
                          return null;
                        },
                      ),
                    ),
                    /* Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(
                            context, _model.shipping.state),
                      ),
                    ),*/
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("City"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("Post Code"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.textInput(
                        context,
                        _model.shipping.city,
                        (value) => {
                          _model.shipping.city = value,
                        },
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "please enter last Name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.textInput(
                          context,
                          _model.shipping.postCode,
                          (value) => {
                            _model.shipping.postCode = value,
                          },
                          onValidate: (value) {
                            if (value.toString().isEmpty) {
                              return "please enter last Name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //  _apiService.ship(this.);
                        Future _model = _apiService.ship(model);
                      });
                      /*   Navigator.pushNamed(
                          context, PaymentMethodsScreen.routeName);*/
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }*/
}
