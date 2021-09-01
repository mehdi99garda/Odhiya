import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'data.dart';
import 'model.dart';


class Conversation extends ChangeNotifier{
  String _message;
  Channel _channel;

  String get message => _message;

  List<Message> messages = [];

  void sendMessage(String text, String uuid) {

    print("dokala");
    print(text);
    if(text != ''){
      print(text);
      messages.insert(0,
        Message(
            sender: 'Me',

            body: text
        ),
      );
      //Webservice.broadcast(Message.me(uuid, text));
      notifyListeners();
    }
  }


  void bindEvent(String channelName, String eventName) async{
    print("begin");
    await initPusher();
    Pusher.connect();

    _channel = await Pusher.subscribe("elfakhar");
   // log("hello");
    _channel.bind('elfakhar_event', (last) {
      final String data = last.data;
      final data1 = json.decode(data);
      print(data1['body']);


      Data.messages.insert(0,
          Message(sender: data1['sender'].toString(), body:data1['body'])

      );
      //log(Data.messages.toString());
      print(Data.messages.length);
      notifyListeners();
    });

  }

  Future<void> initPusher() async {
    try {
      print("lol");
      await Pusher.init('ea653aa09778125e5357', PusherOptions(cluster: 'eu'));
      print("testing");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}

