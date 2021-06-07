class ShippingModel {
  String firstName;
  String lastName;
  // String company;
  String address1;
  // String address2;
  String city;
  String postCode;
  String country;
  //String state;

  ShippingModel({
    this.firstName,
    this.lastName,
    // this.company,
    this.address1,
    //  this.address2,
    this.city,
    this.postCode,
    this.country,
    //  this.state,
  });

  ShippingModel.fromJson(Map<String, dynamic> json) {
    //  firstName = json['first_name'];
    //  lastName = json['last_name'];
    // company = json['company'];
    address1 = json['address_1'];
    //  address2 = json['address_2'];
    city = json['city'];
    postCode = json['postcode'];
    country = json['country'];
    //state = json['state'];
  }

  //post to Api
  Map toJson() {
    var map = new Map<String, dynamic>();
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    //  map["company"] = company;
    map["address_1"] = address1;
    // map["address_2"] = address2;
    map["city"] = city;
    map["postcode"] = postCode;
    map["country"] = country;
    // map["state"] = state;

    return map;
  }
}
