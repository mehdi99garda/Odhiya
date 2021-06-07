import 'package:first_flutter_app/API/models/customer_detail_model.dart';
import 'package:first_flutter_app/API/models/order.dart';
import 'package:first_flutter_app/API/models/shipping.dart';
import 'package:flutter/foundation.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/cart_request_model.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';

class CartProvider with ChangeNotifier {
  APIService _apiService;
  List<CartItem> _cartItems;

  bool _isOrderCreated = false;

  CustomerDetailsModel _customerDetailsModel;
  OrdersModel _ordersModel;

  List<CartItem> get cartItems => _cartItems;
  double get totalRecords => _cartItems.length.toDouble();

  CustomerDetailsModel get customerDetailsModel => _customerDetailsModel;
  OrdersModel get ordersModel => _ordersModel;
  bool get isOrderCreated => _isOrderCreated;

  CartProvider() {
    _apiService = new APIService();
    _cartItems = new List<CartItem>();
  }

  void resetStreams() {
    _apiService = new APIService();
    _cartItems = new List<CartItem>();
  }

  void addToCart(
    CartProducts product,
    Function onCallback,
  ) async {
    CartRequestModel requestModel = new CartRequestModel();
    requestModel.products = new List<CartProducts>();

    if (_cartItems == null) resetStreams();

    _cartItems.forEach((element) {
      requestModel.products.add(new CartProducts(
          productId: element.productId, quantity: element.qty));
    });
    var isProductExist = requestModel.products.firstWhere(
      (prd) => prd.productId == product.productId,
      orElse: () => null,
    );
    if (isProductExist != null) {
      requestModel.products.remove(isProductExist);
    }
    requestModel.products.add(product);

    await _apiService.addtoCart(requestModel).then((responseModel) {
      if (responseModel.data != null) {
        _cartItems = [];
        _cartItems.addAll(responseModel.data);
      }
      onCallback(responseModel);
      notifyListeners();
    });
  }

  fetchCartItems() async {
    if (_cartItems == null) resetStreams();

    await _apiService.getCartItems().then((responseModel) {
      if (responseModel.data != null) {
        _cartItems.addAll(responseModel.data);
      }
      notifyListeners();
    });
  }

  void updateCart(Function onCallback) async {
    CartRequestModel requestModel = new CartRequestModel();
    requestModel.products = new List<CartProducts>();

    if (_cartItems == null) resetStreams();

    _cartItems.forEach((element) {
      requestModel.products.add(new CartProducts(
          productId: element.productId, quantity: element.qty));
    });

    await _apiService.addtoCart(requestModel).then((responseModel) {
      if (responseModel.data != null) {
        _cartItems = [];
        _cartItems.addAll(responseModel.data);
      }
      onCallback(responseModel);
      notifyListeners();
    });
  }

  /* Future<void> fetchShippingDetails() async {
    if (_customerDetailsModel == null) {
      _customerDetailsModel = new CustomerDetailsModel();
    }
    _customerDetailsModel = await _apiService.customerDetails();

    notifyListeners();
  }
*/
  // test post request
  Future<void> fetchShippingDetails1() async {
    if (_customerDetailsModel == null) {
      _customerDetailsModel = new CustomerDetailsModel();
    }
    await _apiService.ship(_customerDetailsModel);

    notifyListeners();
  }
  // end post request

  processOrder(OrdersModel ordersModel) {
    _ordersModel = ordersModel;
    notifyListeners();
  }

  // Future<void> createOrder(ShippingModel _ship) async {
  //   if (_ordersModel.shipping == null) {
  //     _ordersModel.shipping = ShippingModel();
  //   }
  //   if (customerDetailsModel.shipping != null) {
  //     _ordersModel.shipping = _customerDetailsModel.shipping;
  //   }

  //   if (_ordersModel.lineItems == null) {
  //     _ordersModel.lineItems = <LineItemsModel>[];
  //   }

  //   _cartItems.forEach((element) {
  //     _ordersModel.lineItems.add(
  //       LineItemsModel(
  //         productId: element.productId,
  //         quantity: element.qty,
  //         // variationId: element.variationId,
  //       ),
  //     );
  //   });

  //   await _apiService.createOrder(_ordersModel).then((value) {
  //     if (value) {
  //       _isOrderCreated = true;
  //       notifyListeners();
  //     }
  //   });
  // }
}
