import 'dart:convert';
import 'package:first_flutter_app/API/models/order_details.dart';
import 'package:first_flutter_app/API/models/shipping.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
//end

import 'package:first_flutter_app/API/models/cart_request_model.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';
import 'package:first_flutter_app/API/models/customer.dart';
import 'package:first_flutter_app/API/models/category.dart';

import 'package:dio/dio.dart';
import 'package:first_flutter_app/API/models/product.dart';
import 'config.dart';
import 'models/login_model.dart';

import 'package:first_flutter_app/API/models/customer_detail_model.dart';

import 'models/order.dart';

import 'dart:developer';

class APIService {
  // start class APIService

  // start  method creatCustomer
  Future<bool> creatCustomer(CustomerModel model) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );
    bool ret = false;

    try {
      var response = await Dio().post(Config.url + Config.customerURL,
          data: model.toJson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e);
        print(e.response.statusCode);
        ret = false;
      } else {
        print(e.message);
        print(e.requestOptions); //request
        ret = false;
      }
    }
    return ret;
  }

  ////start sign in
  Future<LoginResponse> loginCustomer(String email, String password) async {
    LoginResponse model;
    // var authorization =
    //     'Basic ' + base64Encode(utf8.encode('$email:$password'));
    // var authToken = base64.encode(
    //   utf8.encode(Config.key + ':' + Config.secret),
    // );

    try {
      var response = await Dio().post(
        Config.tokenURL,
        data: {
          'username': email,
          'password': password,
        },
        options: new Options(
          headers: {
            //  HttpHeaders.authorizationHeader: 'Bearer $authToken',
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
          },
        ), // responseType: ResponseType.json);
      );
      //  Map<String, dynamic> decodedData = jsonDecode(response.data);
      // print(decodedData);
      // print('response ${response.data}');
      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
      // throw e;
    }
    return model;
  }
  //// end of function

// End method creatCustomer
//
// sart method getCategories
  Future<List<Category>> getCategories() async {
    List<Category> data = new List<Category>();

    try {
      String url = Config.url +
          Config.categoriesURL +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Category.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  // End method getCategories
  //
  // start method getProducts
  Future<List<Product>> getProducts({
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder = "asc",
  }) async {
    List<Product> data = new List<Product>();

    try {
      String parameter = "";
      if (strSearch != null) {
        parameter += "&search=$strSearch";
      }
      if (pageSize != null) {
        parameter += "&per_page=$pageSize";
      }
      if (pageNumber != null) {
        parameter += "&page=$pageNumber";
      }
      if (tagName != null) {
        parameter += "&tag=$tagName";
      }
      if (categoryId != null) {
        parameter += "&category=$categoryId";
      }
      if (sortBy != null) {
        parameter += "&orderby=$sortBy";
      }
      if (sortOrder != null) {
        parameter += "&order=$sortOrder";
      }

      String url = Config.url +
          Config.productsURL +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secret}${parameter.toString()}";
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
  // End method getProducts
  //
  // Start method Add To Cart

  Future<CartResponseModel> addtoCart(CartRequestModel model) async {
    model.userId = int.parse(Config.userId);
    CartResponseModel responseModel;

    try {
      var response = await Dio().post(
        Config.url + Config.addtoCartURL,
        data: model.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.requestOptions); //request
      }
    }
    return responseModel;
  }

  // End method Add To Cart
  //
  // Start method getCartItems
  Future<CartResponseModel> getCartItems() async {
    CartResponseModel responseModel;

    try {
      String url = Config.url +
          Config.cartURL +
          "?user_id=${Config.userId}&consumer_key=${Config.key}&consumer_secret=${Config.secret}";

      print(url);
      var response = await Dio().get(url,
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return responseModel;
  }

  // End method getCartItems

  //start remove function
  Future<bool> supp(int prodId) async {
    bool ret = false;
    try {
      String url = Config.url +
          Config.productsURL +
          "?user_id=${Config.userId}&consumer_key=${Config.key}&consumer_secret=${Config.secret}";

      print(url);
      var response = await Dio().get(url,
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 200) {
        ret = true;
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return ret;
  }
  //end remove function
  //start getcustomerdetail

  Future<CustomerDetailsModel> customerDetails() async {
    CustomerDetailsModel responseModel;

    try {
      String url = Config.url +
          Config.customerURL +
          "/${Config.userId}?&consumer_key=${Config.key}&consumer_secret=${Config.secret}";

      var response = await Dio().get(url,
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 200) {
        responseModel = CustomerDetailsModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return responseModel;
  }

  // end getcustomersdetails

  // start test custemers detail post request

  Future<CustomerDetailsModel> ship(CustomerDetailsModel model) async {
    model.id = int.parse(Config.userId);
    try {
      var response = await Dio().post(
        Config.url + Config.orderURL,
        data: model.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                'Basic eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvb2RoaXlhLmNvbSIsImlhdCI6MTYyMjU0ODgyMiwibmJmIjoxNjIyNTQ4ODIyLCJleHAiOjE2MjMxNTM2MjIsImRhdGEiOnsidXNlciI6eyJpZCI6IjE0In19fQ.-nuZT1JtlC2JYJqTzWGe7dv52rV8cvd4BlvUAN7A71A',
          },
        ),
      );
      if (response.statusCode == 200) {
        model = CustomerDetailsModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.requestOptions); //request
      }
    }
    return model;
  }

  // end test costumer detail ost request

  //start creat order
  Future<bool> createOrder(OrdersModel model) async {
    bool isOrderCreated = false;
    model.customerId = int.parse(Config.userId);

    var authToken =
        base64.encode(utf8.encode(Config.key + ":" + Config.secret));

    //log('data: $model');
    try {
      var response = await Dio().post(
        Config.url + Config.orderURL,
        data: model.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: 'Basic $authToken',
          },
        ),
        // body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 201) {
        isOrderCreated = true;
      }
    } catch (error) {
      print(error);
    }
    return isOrderCreated;
  }

  //end creat order

  //start payment shippping test
  /* Future<CustomerDetailsModel> customerDetails(CartRequestModel model) async {
    model.userId = int.parse(Config.userId);
    CartResponseModel responseModel;

    try {
      var response = await Dio().post(
        Config.url + Config.addtoCartURL,
        data: model.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.requestOptions); //request
      }
    }
    return responseModel;
  }*/

  //end payment shipping test
  //start order
  Future<List<OrdersModel>> getOrders() async {
    List<OrdersModel> data = <OrdersModel>[];
    // String fullOrdersUrl = Config.orderURL +
    //   "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";

    try {
      /* http.Response response = await http.get(
        Uri.parse(fullOrdersUrl),
        headers: {"Content-type": "application/json"},
      );*/
      String url = Config.url +
          Config.orderURL +
          "?customer=${Config.userId}&consumer_key=${Config.key}&consumer_secret=${Config.secret}";

      var response = await Dio().get(url,
          options: new Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          ));
      // List<dynamic> _decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map((i) => OrdersModel.fromJson(i))
            .toList();
        /*_decodedData.map((e) => OrdersModel.fromJson(e)).toList();*/
      }
    } catch (error) {
      print(error);
    }

    return data;
  }

  // Future<OrderDetailsModel> getOrdersDetails(int orderId) async {
  //   OrderDetailsModel responseModel = OrderDetailsModel();
  //   String fullOrderUrl = Config.orderURL +
  //       "/" +
  //       orderId.toString() +
  //       "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse(fullOrderUrl),
  //       headers: {"Content-type": "application/json"},
  //     );

  //     var _decodedData = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       responseModel = OrderDetailsModel.fromJson(_decodedData);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }

  //   return responseModel;
  // }

  Future<OrderDetailsModel> getOrdersDetails(int orderId) async {
    OrderDetailsModel responseModel = OrderDetailsModel();
    String fullOrderUrl = Config.url +
        Config.orderURL +
        "/" +
        orderId.toString() +
        "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
    try {
      var response = await Dio().get(fullOrderUrl,
          options: new Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          ));

      //var _decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        responseModel = OrderDetailsModel.fromJson(response.data);
      }
    } catch (error) {
      print(error);
    }

    return responseModel;
  }

  //end order
//start
  // static Future<String> uploadSingleImage(File file) async {
  //   var authToken = base64.encode(
  //     utf8.encode(Config.key + ":" + Config.secret),
  //   );
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = authToken;
  //   //final value = prefs.get(key) ?? 0;
  //   /*var value = base64.encode(
  //     utf8.encode(Config.key + ":" + Config.secret),
  //   );*/

  //   String fileName = file.path.split("/").last;
  //   var stream = new http.ByteStream(file.openRead());
  //   stream.cast();
  //   // get file length

  //   var length = await file.length(); //imageFile is your image file
  //   Map<String, String> headers = {
  //     "Accept": "application/json",
  //     "Authorization": "Bearer $authToken"
  //   }; // ignore this headers if there is no authentication

  //   // string to uri
  //   var uri = Uri.parse(Config.uri);

  //   // create multipart request
  //   var request = new http.MultipartRequest("POST", uri);

  //   // multipart that takes file
  //   var multipartFileSign =
  //       new http.MultipartFile('photo', stream, length, filename: fileName);

  //   // add file to multipart
  //   request.files.add(multipartFileSign);

  //   //add headers
  //   request.headers.addAll(headers);

  //   //adding params
  //   // request.fields['id'] = userid;
  //   // request.fields['firstName'] = 'abc';
  //   // request.fields['lastName'] = 'efg';

  //   // send
  //   var response = await request.send();

  //   print(response.statusCode);

  //   // listen for response
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print(value);
  //   });
  // }

//end

//test Get wishlist
  Future<CartResponseModel> getWishlist() async {
    CartResponseModel responseModel;

    try {
      String url = Config.url + Config.wishlist;
      //"?user_id=${Config.userId}&consumer_key=${Config.key}&consumer_secret=${Config.secret}";

      print(url);
      var response = await Dio().get(url,
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return responseModel;
  }
//end test get wislist

// start test add Product
  Future<Product> createProduct(Product model) async {
    Product responseModel;
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );

    var response = await Dio().post(
      Config.url + Config.productsURL,
      data: model.toJson(),
      options: new Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: 'Basic $authToken',
        },
      ),
      // body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 201) {
      responseModel = Product.fromJson(response.data);
      return responseModel;
    } else {
      return null;
    }
  }

// end test add product

  Future<String> uploadImage(filePath) async {
    //String url = "$apiURL/wp-json/wp/v2/media";
    String url = "https://odhiya.com/wp-json/wp/v2/media";

    String fileName = filePath.path.split('/').last;
    //LoginResponseModel loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Authorization':
          //'Bearer ${loginDetails.data.token}',
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvb2RoaXlhLmNvbSIsImlhdCI6MTYyOTI4Mzg3MCwibmJmIjoxNjI5MjgzODcwLCJleHAiOjE2Mjk4ODg2NzAsImRhdGEiOnsidXNlciI6eyJpZCI6MTR9fX0.qnjI5NZ9dWG3XVNu3OVMy8q10mPvVbfJ1t3tfCTbwqE',
      'Content-Disposition': 'attachment; filename=$fileName',
      'Content-Type': 'image/jpeg'
    };

    List<int> imageBytes = File(filePath.path).readAsBytesSync();
    var request = http.Request('POST', Uri.parse(url));
    request.headers.addAll(requestHeaders);
    request.bodyBytes = imageBytes;
    var res = await request.send();

    if (res.statusCode == 201) {
      return await getImageUrl(res.headers["location"]);
    }
    return null;

    // return res.statusCode == 201 ? true : false;
  }

  static var client = http.Client();

  static Future<String> getImageUrl(url) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json'};
    var response = await client.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      return jsonString["source_url"];
    } else {
      return null;
    }
  }
}
