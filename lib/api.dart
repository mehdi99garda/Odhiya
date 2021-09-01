import 'dart:convert';


import 'package:flutter_app_chat/tt.dart';

import 'package:http/http.dart' as http;

import 'model.dart';



class Webservice
{
  static Future load(Resource resource) async{
    print("start");


    http.Response response = await http.get(
      'https://laravel-flutter-chat.herokuapp.com/api/messages?sender_id=1&receiver_id=3',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    var jsonData = jsonDecode(response.body);
    List<Message> users = [];
    for(var u in jsonData){
      Message user = Message();
      user.body = u["body"];

      users.add(user);
    }
    print("finished");
    print(users);

    return users;
  }


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
      },
    );

    return Resource.parse(response);
  }
}