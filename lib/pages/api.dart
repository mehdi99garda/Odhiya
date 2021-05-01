/*import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'AddPub/Add_images.dart';

import 'AddPub/Add_images.dart';

class APIServices {
  static var client = http.Client();
  static String apiURL = "https://odhiya.com/wp-json/wc/v3/";
  static Future<bool> uploadImage(File) async {
    String url = "$apiURL/wp-json/wp/v2/media";
    String fileName = AddImages.imageFile1.toString().split("/").last;

// LoginResponseModel loginDetails =await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      //'Authorization':'Bearer ${loginDetails.data.token}',
      'Content-type': 'image/jpeg',
      'Content-Disposition': 'attachment : filename=$fileName',
    };
    List<int> imagesBytes =
        File(AddImages.imageFile1.toString()).readAsBytesSync();
    var request = http.Request('POST', Uri.parse(url));
    request.headers.addAll(requestHeaders);
    request.bodyBytes = imagesBytes;
    var res = await request.send();
    return res.statusCode == 201 ? true : false;
  }
}
*/
