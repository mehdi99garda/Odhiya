import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'models/message_model.dart';
import 'chat_screen.dart';
>>>>>>> 37bef64 (product detail integration)

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  double x = 0;
  double y = 0;
  double scaleFactor = 1;
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
<<<<<<< HEAD
        textDirection: TextDirection.rtl,
=======
        textDirection: TextDirection.ltr,
>>>>>>> 37bef64 (product detail integration)
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isMenuOpen ? 40 : 0)),
          transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
<<<<<<< HEAD
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isMenuOpen
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                x = 0;
                                y = 0;
                                scaleFactor = 1;
                                isMenuOpen = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                x = -75;
                                y = 120;
                                scaleFactor = 0.7;
                                isMenuOpen = true;
                              });
                            }),
                    Column(children: [
                      Image(
                        image: AssetImage('images/logo_odhiya.png'),
                        height: 100,
                      )
                    ]),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              Navigator.of(context).pushNamed('searchpage');
                            }),
                        IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.of(context).pushNamed('home');
                            }),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Continue Chating..',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'اكمل محادثتك...',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
    /*Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text('Continue Chating..'),
        ),
      ),
    );*/
=======
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: chat.sender,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: chat.unread
                              ? BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  // shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                )
                              : BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        chat.sender.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      chat.sender.isOnline
                                          ? Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              width: 7,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            )
                                          : Container(
                                              child: null,
                                            ),
                                    ],
                                  ),
                                  Text(
                                    chat.time,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
>>>>>>> 37bef64 (product detail integration)
  }
}
