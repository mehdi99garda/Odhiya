import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'بحث',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(175, 182, 179, 0.5),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            color: Color.fromRGBO(175, 182, 179, 0.5),
          ),
        ),
      ),
    );
  }
}
