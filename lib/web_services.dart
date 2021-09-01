import 'dart:convert';

import 'package:flutter_app_chat/model.dart';

import 'package:flutter_app_chat/tt.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class Webservice
{
 static Future load(Resource resource) async{
   print("start");


    http.Response response = await http.get(
      'https://laravel-flutter-chat.herokuapp.com/api/user',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for(var u in jsonData){
      User user = User();
      user.name = u["name"];
      user.email = u["email"];
      users.add(user);
    }
    print("finished");

    return users;
  }
  //start message

  static Future post(Resource resource) async{
    http.Response response = await http.post(
        'https://laravel-flutter-chat.herokuapp.com/api/user/${resource.url}',
        body: resource.data
    );

    return resource.parse(response);
  }



  static Future broadcast(Resource resource) async{
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    //String token = prefs.getString('access_token');

    http.Response response = await http.post(
      'https://laravel-flutter-chat.herokuapp.com/api/messages',
      body: resource.data,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'bearer '+ token
      },
    );

    return resource.parse(response);
  }

  static Future get(Resource) async{
    http.Response response = await http.get(
      'https://laravel-flutter-chat.herokuapp.com/api/user',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'bearer '+ resource.token
      },
    );

    return Resource.parse(response);
  }
}