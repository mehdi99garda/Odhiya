import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_chat/users.dart';
import 'package:flutter_app_chat/web_services.dart';
import 'package:http/http.dart' as http;
import 'models.dart';


class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final LoginPro login = Provider.of<LoginPro>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Users Screen'),

      ),
      body: Center(
        child: FutureBuilder(
          future: Webservice.load(User.all),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  User user = snapshot.data[index];

                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () async {
                      

                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChatScreen(user : user)
                          ),
                      );


                    },
                  );
                },
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}