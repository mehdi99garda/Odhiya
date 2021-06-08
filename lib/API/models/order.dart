import './shipping.dart';

class OrdersModel {
  int customerId;
//  // int orderId;
//   String orderNumber;
//   String status;
//   DateTime orderDate;

  ShippingModel shipping;
  // String paymentMethod;
  // String paymentMethodTitle;
  // bool setPaid;
  // String transactionId;
  //List<LineItemsModel> lineItems;

  OrdersModel({
    // this.customerId,
    // this.orderId,
    // this.orderNumber,
    // this.status,
    // this.orderDate,
    // this.paymentMethod,
    // this.paymentMethodTitle,
    // this.setPaid,
    // this.transactionId,
    // this.lineItems,
    this.shipping,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    //   orderId = json['id'];
    //   status = json['status'];
    //   orderNumber = json['order_key'];
    //   orderDate = DateTime.parse(json['date_created']);
  }

  Map toJson() {
    var map = new Map<String, dynamic>();
    map["customer_id"] = customerId;
    // map["payment_method"] = paymentMethod;
    // map["payment_method_title"] = paymentMethodTitle;
    // map["set_paid"] = setPaid;
    // map["transaction_id"] = transactionId;
    if (map["shipping"] != null) {
      map["shipping"] = shipping.toJson();
    }
    // if (lineItems != null) {
    //   map["line_items"] = lineItems.map((e) => e.toJson()).toList();
    // }

    // map["id"] = orderId;
    // map["status"] = status;
    // map["order_key"] = orderNumber;
    // map["date_created"] = orderDate;
    // map["date_created"] = paymentMethod;
    // map["payment_method_title"] = paymentMethodTitle;
    // map["set_paid"] = setPaid;
    // map["transaction_id"] = transactionId;
    // if (lineItems != null) {
    //   map["line_items"] = lineItems!.map((e) => e.toJson()).toList();
    // }
    return map;
  }
}

// class LineItemsModel {
//   int productId;
//   int quantity;
//   //int variationId;

//   LineItemsModel({
//     this.productId,
//     this.quantity,
//     // this.variationId,
//   });

// LineItemsModel.fromJson(Map<String, dynamic> json) {
//   productId = json['product_id'];
//   quantity = json['quantity'];
//   // variationId = json['variation_id'];
// }

// Map toJson() {
//   var map = new Map<String, dynamic>();
//   map["product_id"] = productId;
//   map["quantity"] = quantity;
//   // if (variationId != null) {
//   //   map["variation_id"] = variationId;
//   // }
//   return map;
// }
