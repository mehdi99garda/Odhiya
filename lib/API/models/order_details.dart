import './shipping.dart';

class OrderDetailsModel {
  int orderId;
  String orderNumber;
  String paymentMethod;
  String orderStatus;
  DateTime orderDate;
  ShippingModel shipping;
  List<OrderDetailsLineModel> lineItems;
  double totalAmount;
  double shippingTotal;
  double itemTotalAmount;

  OrderDetailsModel({
    this.orderId,
    this.orderNumber,
    this.paymentMethod,
    this.orderStatus,
    this.orderDate,
    this.shipping,
    this.lineItems,
    this.totalAmount,
    this.shippingTotal,
    this.itemTotalAmount,
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['id'];
    orderNumber = json['order_key'];
    paymentMethod = json['payment_method_title'];
    orderStatus = json['status'];
    orderDate = DateTime.parse(json['date_created']);
    shipping = json['shipping'] != null
        ? ShippingModel.fromJson(json['shipping'])
        : null;
    if (json['line_items'] != null) {
      lineItems = <OrderDetailsLineModel>[];
      json['line_items'].forEach((_item) {
        lineItems.add(OrderDetailsLineModel.fromJson(_item));
      });

      itemTotalAmount = lineItems != null
          ? lineItems
              .map<double>((_item) => _item.totalAmount)
              .reduce((value, element) => value + element)
          : 0;
    }
    totalAmount = double.parse(json['total']);
    shippingTotal = double.parse(json['shipping_total']);
  }

  Map toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = orderId;
    map["order_number"] = orderNumber;
    map["payment_method_title"] = paymentMethod;
    map["status"] = orderStatus;
    map["date_created"] = orderDate;
    map["shipping"] = shipping.toJson();
    if (lineItems != null) {
      map["line_items"] = lineItems.map((e) => e.toJson()).toList();
    }
    map["total"] = totalAmount;
    map["shipping_total"] = shippingTotal;
    map["item_total"] = itemTotalAmount;

    return map;
  }
}

class OrderDetailsLineModel {
  int productId;
  String productName;
  int quantity;
  int variationId;
  double totalAmount;

  OrderDetailsLineModel({
    this.productId,
    this.productName,
    this.quantity,
    this.variationId,
    this.totalAmount,
  });

  OrderDetailsLineModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['name'];
    quantity = json['quantity'];
    variationId = json['variation_id'];
    totalAmount = double.parse(json['total']);
  }

  Map toJson() {
    var map = new Map<String, dynamic>();
    map["product_id"] = productId;
    map["name"] = productName;
    map["quantity"] = quantity;
    map["total"] = totalAmount;
    if (variationId != null) {
      map["variation_id"] = variationId;
    }

    return map;
  }
}
