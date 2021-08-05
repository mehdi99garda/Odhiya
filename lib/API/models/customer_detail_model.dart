//import './billing.dart';
import './shipping.dart';

class CustomerDetailsModel {
  int id;
  String firstName;
  String lastName;
  // BillingModel billing;
  ShippingModel shipping;

  CustomerDetailsModel(
      {this.id,
      this.firstName,
      this.lastName,
      /*this.billing */ this.shipping});

  CustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];

    //   /* billing =
    //       json['billing'] != null ? BillingModel.fromJson(json['billing']) : null;*/

    shipping = json['shipping'] != null
        ? ShippingModel.fromJson(json['shipping'])
        : null;
  }

  //post to Api
  Map toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    //  map["billing"] = billing;
    map["shipping"] = shipping;
    return map;
  }
}
