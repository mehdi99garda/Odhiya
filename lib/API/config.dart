import 'package:first_flutter_app/pages/login.dart';

import 'models/login_model.dart';

class Config {
  static String key = "ck_93834663aadfcca38373f322d0e27aa25ff7dcfe";
  static String secret = "cs_ce664a6e71f44c03d7653b93f5e0721bdd945bc3";
  static String url = "https://odhiya.com/wp-json/wc/v3/";
  static String customerURL = "customers";
  static String tokenURL = "https://odhiya.com/wp-json/jwt-auth/v1/token";
  static String categoriesURL = "products/categories";
  static String uri = "https://odhiya.com/wp-json/wp/v2/media";
  static String productsURL = "products";
  static String mouton = "455";
  static String vache = "465";
  static String chevre_ar = "467";
  static String chevre_fr = "459";
  //static String ="";
  //start add to cart
  static String addtoCartURL = "addtocart";
  static String cartURL = "cart";

  // User ID stores in this variable

  //static String userId = Login.userID;
  static String userId = "15";

  static String urll = "https://odhiya.com/wp-json/wc/v3/wp-json/wp/v2/media";
  static String orderURL = "orders";
  static String currency = "Ksh ";

  static String paypalClientID =
      "ATBBhBywM1OOi_cLUkn-f8cBY7f4sZqBTFyeKQiGRa6PQDY2Q-YV3UZlHAsIhyg2dTrqjc7NzwoJTTM9";
  static String paypalSecretKey =
      "EFB3XOa8hUWb7SdTGrerY8lbB-oE1ChE68KSEAlI_Wgea91e2LbpM4oSwaI8Mz8KOmj1nPkxGlvYAiNs";
  static String paypalURL = "https://api.sandbox.paypal.com";

  // for production app
  // static String  paypalURL = "https://api.paypal.com";
  // end add to cart
}
