import 'dart:convert';

import 'package:flutter_app_chat/tt.dart';

class Message
{
  String body;
String sender;

  Message({
    this.body,
    this.sender

  });

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      body: json['name'],
      sender: json['sender']

    );
  }

  static Resource me(String token) {
    return Resource(
        url: 'me',
        //token: token,
        parse: (response){
          return Message.fromJson(
              json.decode(response.body)
          );
        }
    );
  }

  /* static Resource logout(String token) {
    return Resource(
        url: 'logout',
        token: token,
        parse: (response){
          return User.fromJson(
              json.decode(response.body)
          );
        }
    );
  }*/

  static Resource get all {
    return Resource(
        url: 'users',
        parse: (response){
          Iterable list = json.decode(response.body)['data'];

          return list.map((users) {
            return Message.fromJson(users);
          }).toList();
        }
    );
  }



/*static Resource login(String email, String password){
    return Resource(
        url: 'login',
        data: {
          'email': email,
          'password': password
        },
        parse: (response){
          return User.fromJson(
              json.decode(response.body)
          );
        }
    );
  }*/
}