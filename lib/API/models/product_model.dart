// class Productmodel {
//   // int id;
//   String name;
//   // String description;
//   // String shortDescription;
//   // String sku;
//   String regularprice;
//   //String price;
//   // String regularPrice;
//   // String salePrice;
//   // String stockStatus;
//   List<Images> images;
//   // List<Categories> categories;

//   Productmodel(
//       {
//       // this.id,
//       this.name,
//       // this.description,
//       // this.shortDescription,
//       // this.sku,
//       this.regularprice,
//       //this.price,
//       // this.regularPrice,
//       // this.salePrice,
//       // this.stockStatus,
//       this.images});

//   Productmodel.fromJson(Map<String, dynamic> json) {
//     // id = json['id'];
//     name = json["name"];
//     regularprice = json["regular_price"];
//     // description = json['description'];
//     // shortDescription = json['short_description'];
//     // sku = json['sku'];
//     // price = json['price'];
//     // regularPrice = json['regular_price'];
//     // salePrice =
//     //     json['sale_price'] != "" ? json['sale_price'] : json['regular_price'];

//     // stockStatus = json['stock_status'];
//     // if (json['categories'] != null) {
//     //   categories = new List<Categories>();
//     //   json['categories'].forEach((v) {
//     //     categories.add(new Categories.fromJson(v));
//     //   });
//     // }
//     if (json["images"] != null) {
//       images = new List<Images>();
//       json["images"].forEach((v) {
//         images.add(new Images.fromJson(v));
//       });
//     }
//   }

//   //test add product
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();

//     // data["id"] = this.id;
//     data["name"] = this.name;
//     data["regular_price"] = this.regularprice;

//     //data["type"] = this.type;
//     // data["description"] = this.description;
//     //data["price"] = this.price;

//     if (this.images != null) {
//       data["images"] = this.images.map((e) => e.toJson()).toList();
//     }
//     return data;
//   }
//   //end test add product
//   // video 6 , min40.39

//   // calculateDiscount() {
//   //   double regularPrice = double.parse(this.regularPrice);
//   //   double salePrice =
//   //       this.salePrice != "" ? double.parse(this.salePrice) : regularPrice;
//   //   double discount = regularPrice - salePrice;
//   //   double disPercent = (discount / regularPrice) * 100;

//   //   return disPercent.round();
//   // }
// }

// // class Categories {
// //   int id;
// //   String name;

// //   Categories({
// //     this.id,
// //     this.name,
// //   });

// //   Categories.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //   }
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     return data;
// //   }
// // }

// class Images {
//   // int id;
//   String src;
//   // bool isUpload = false;

//   Images({
//     //  this.id,
//     this.src,
//   });

//   Images.fromJson(Map<String, dynamic> json) {
//     // id = json['id'];
//     src = json['src'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();

//     //data["id"] = this.id;
//     data["src"] = this.src;
//     return data;
//   }
// }
