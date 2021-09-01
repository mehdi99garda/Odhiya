import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat/cc.dart';
import 'package:provider/provider.dart';
import 'conversation.dart';
import 'data.dart';
import 'models.dart';



class ChatScreen extends StatefulWidget {
  User user;
  ChatScreen({User user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final ScrollController _scrollController = new ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'message': ''};


  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  void sendMessage(conversation, controller, user){
    _formKey.currentState.save();

    conversation.sendMessage(_formData['message'], user.uuid);
    controller.clear();

    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }


  @override
  Widget build(BuildContext context) {
   // final Conversation conversation = Provider.of<Conversation>(context);
    final Conversation conversation = Conversation();
    final TextEditingController _controller = TextEditingController();
   Future<Album> _futureAlbum;
    conversation.bindEvent("lol", 'elfakhar-event');

    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(


                child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                    itemCount:Data.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                    print("dd");
                    print(Data.messages[index]);
                    print("gg");

                    return ListTile(

                      title: Text(Data.messages[index].sender.toString()),
                      subtitle: Text(Data.messages[index].body),
                    );
                  },
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 70.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Form(
                     key: _formKey,
                      child: TextFormField(
                       controller: _controller,
                        textCapitalization: TextCapitalization.sentences,
                        onSaved: (String value){
                          setState(() {
                            _formData['message'] = value;
                          });

                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type a message...',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 25.0,
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        _futureAlbum = post(_controller.text);
                      });

                      //sendMessage(conversation, _controller, widget.user);
                    },
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
   }


}