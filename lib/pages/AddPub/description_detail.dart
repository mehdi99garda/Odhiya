import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Descriptiondetail extends StatefulWidget {
  @override
  _DescriptiondetailState createState() => _DescriptiondetailState();
}

class _DescriptiondetailState extends State<Descriptiondetail> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
          child: Column(
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
                        labelText: 'Title'),
                  )),
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
                        labelText: 'Description'),
                  )),
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
                        labelText: 'Ville'),
                  )),
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
                        labelText: 'Prix'),
                  )),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      'Valider',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('');
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
