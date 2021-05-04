import 'dart:convert';
import 'dart:io';

<<<<<<< HEAD
import 'package:woocomerce_app/API/models/cart_request_model.dart';
import 'package:woocomerce_app/API/models/cart_response_model.dart';
import 'package:woocomerce_app/API/models/customer.dart';
import 'package:woocomerce_app/API/models/category.dart';

import 'package:dio/dio.dart';
import 'package:woocomerce_app/API/models/product.dart';
import 'config.dart';
=======
import 'package:first_flutter_app/API/models/cart_request_model.dart';
import 'package:first_flutter_app/API/models/cart_response_model.dart';
import 'package:first_flutter_app/API/models/customer.dart';
import 'package:first_flutter_app/API/models/category.dart';

import 'package:dio/dio.dart';
import 'package:first_flutter_app/API/models/product.dart';
import 'config.dart';
import 'models/login_model.dart';
>>>>>>> 37bef64 (product detail integration)

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
<<<<<<< HEAD
        print(e.request);
=======
        print(e.requestOptions); //request
>>>>>>> 37bef64 (product detail integration)
        ret = false;
      }
    }
    return ret;
  }

<<<<<<< HEAD
=======
  ////start sign in
  Future loginCustomer(String username, String password) async {
    LoginResponse model;
    var authorization =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var authToken = base64.encode(
      utf8.encode(Config.key + ':' + Config.secret),
    );

    try {
      var response = await Dio().post(
        Config.tokenURL,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $authToken',
          HttpHeaders.contentTypeHeader: 'application/x-www-from-urlencoded'
        }, responseType: ResponseType.json),
      );
      print('rea');
      print('response ${response.data}');
      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print('error:${e.message}');
      throw e;
    }
    return model;
  }
  //// end of function

>>>>>>> 37bef64 (product detail integration)
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
    model.userId = int.parse(Config.userID);
    CartResponseModel responseModel;

    try {
      var response = await Dio().post(
        Config.url +
            Config.addtoCartURL +
            "?consumer_key=${Config.key}&consumer_secret=${Config.secret}",
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
<<<<<<< HEAD
        print(e.request);
=======
        print(e.requestOptions); //request
>>>>>>> 37bef64 (product detail integration)
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
          "?user_id=${Config.userID}&consumer_key=${Config.key}&consumer_secret=${Config.secret}";

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

}
