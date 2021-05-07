import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static Future<String> uploadSingleImage(File file, String userid) async {
    final prefs = await SharedPreferences.getInstance();
    var value = base64.encode(
      utf8.encode("ck_93834663aadfcca38373f322d0e27aa25ff7dcfe" +
          ":" +
          "cs_ce664a6e71f44c03d7653b93f5e0721bdd945bc3"),
    );

    String fileName = file.path.split("/").last;
    var stream = new http.ByteStream(file.openRead());
    stream.cast();
    // get file length

    var length = await file.length(); //imageFile is your image file
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $value"
    }; // ignore this headers if there is no authentication
    var apiURL = "https://odhiya.com/wp-json/wc/v3/";
    // string to uri
    var uri = Uri.parse(apiURL + "/wp-json/wp/v2/media");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFileSign =
        new http.MultipartFile('photo', stream, length, filename: fileName);

    // add file to multipart
    request.files.add(multipartFileSign);

    //add headers
    request.headers.addAll(headers);

    //adding params
    request.fields['id'] = userid;
    // request.fields['firstName'] = 'abc';
    // request.fields['lastName'] = 'efg';

    // send
    var response = await request.send();

    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}
