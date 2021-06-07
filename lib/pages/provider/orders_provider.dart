import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/order.dart';
import 'package:flutter/material.dart';

/*import '../models/order.dart';
import '../repository/api_service.dart';*/

class OrdersProvider with ChangeNotifier {
  APIService _apiService;

  List<OrdersModel> _orderList = [];
  List<OrdersModel> get allOrders => _orderList;
  double get totalOrders => _orderList.length.toDouble();

  OrdersProvider() {
    resetStreams();
  }

  void resetStreams() {
    _apiService = APIService();
  }

  fetchOrders() async {
    List<OrdersModel> _myOrdersList = await _apiService.getOrders();
    if (_myOrdersList.length > 0) {
      _orderList = <OrdersModel>[];
      _orderList.addAll(_myOrdersList);
    }
    notifyListeners();
  }
}
