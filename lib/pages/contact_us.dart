import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                  height: 60,
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
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText:
                            Home.lang_ar ? 'الاسم الكامل' : 'Nom Complet'),
                  )),
              SizedBox(height: 10),
              Container(
                  height: 60,
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
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText:
                            Home.lang_ar ? 'بريد إلكتروني' : 'Email Adresse'),
                  )),
              SizedBox(height: 10),
              Container(
                  height: 60,
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
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'هاتف' : 'Telephone'),
                  )),
              SizedBox(height: 10),
              Container(
                  height: 60,
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
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'موضوع' : 'Sujet'),
                  )),
              SizedBox(height: 10),
              Container(
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
                    maxLines: 5,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        labelText: Home.lang_ar ? 'رسالة' : 'Message'),
                  )),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      Home.lang_ar ? 'إرسال' : 'Envoyer',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      //Navigator.of(context).pushNamed('');
                    },
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
