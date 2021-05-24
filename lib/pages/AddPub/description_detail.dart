import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class Descriptiondetail extends StatefulWidget {
  @override
  _DescriptiondetailState createState() => _DescriptiondetailState();
}

class _DescriptiondetailState extends State<Descriptiondetail> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 30,
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                  height: 55,
                  margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                  padding: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'العنوان' : 'Title'),
                  )),
              SizedBox(height: 20),
              Container(
                  //height: 60,
                  margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                  padding: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: TextFormField(
                    maxLines: 5,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'وصف' : 'Description'),
                  )),
              SizedBox(height: 20),
              Container(
                  height: 55,
                  margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                  padding: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'المدينة' : 'Ville'),
                  )),
              SizedBox(height: 20),
              Container(
                  height: 55,
                  margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                  padding: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'الثمن' : 'Prix'),
                  )),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      Home.lang_ar ? 'موافق' : 'Valider',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
