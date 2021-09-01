import 'dart:convert';

import 'package:flutter_app_chat/tt.dart';

class User
{
  String name;
  String email;

  User({
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  static Resource me(String token) {
    return Resource(
        url: 'me',
        //token: token,
        parse: (response){
          return User.fromJson(
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
            return User.fromJson(users);
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