
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pusher_websocket_flutter/pusher.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeState();

    // TODO: implement createState
  }
class _HomeState extends State<Home> {
Channel _channel;
int _saldo =0 ;
List _history = [];
  @override
  void initState() {
    super.initState();
    _intPusher();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 35,
                        child: Icon(Icons.camera_alt, color: Colors.grey,),
                      ),
                      SizedBox(height: 10),
                      Text('elfakhar', style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Saldo Anda'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Baseline(
                                    baseline: 5,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text('RP'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _saldo.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),
                      ),
                    ]
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text('stori Transaski'),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    itemCount: _history.length,
                      itemBuilder: (context,index){
                      return ListTile(
                        title : Text('RP ${_history[index]['nominal']}'),
                        subtitle : Text('dari ${_history[index]['sender']}'),
                        trailing: Text(_history[index]['time']),
                      );
                      },
                ),
              ),
              )
            ],
          ),
        ),
      );;
   
  }
  Future<void>_intPusher() async {
    try {
     await Pusher.init('ea653aa09778125e5357',PusherOptions(cluster:'eu'));
    }catch (e){
      print(e);
    }
    //connection
    Pusher.connect(
      onConnectionStateChange: (val){
        print(val.currentState);
      },
      onError: (err) {
        print(err.message);
      }

    );
    // subscribe
    _channel = await Pusher.subscribe('elfakhar');
    // bind
    _channel.bind('elfakhar_event', (onEvent) {
      //print(onEvent.data);
      if(mounted) {
        final data = json.decode(onEvent.data);
        setState(() {
          _saldo += int.parse(data['nominal']);
        });
        _history.add(
            {'nominal': int.parse(data['nominal']),
              'sender': data['sender'],
              'time': data['time']
            });
        print(_history);
      }
    });

  }
}



