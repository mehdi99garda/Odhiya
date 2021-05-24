import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Home.dart';

class UpdateAnnonce extends StatefulWidget {
  @override
  _UpdateAnnonceState createState() => _UpdateAnnonceState();
}

class _UpdateAnnonceState extends State<UpdateAnnonce> {
  PickedFile imageFile1;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageFile1 == null
                                ? AssetImage('images/cow1.jpg')
                                : FileImage(File(imageFile1.path)),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                        bottom: -1,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomsheet1()));
                              },
                              child: Icon(Icons.camera_alt,
                                  color: Colors.grey, size: 30)),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: '1500',
                  decoration: InputDecoration(
                    labelText: Home.lang_ar ? 'الثمن' : 'Prix',
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.green[200],
                    ),
                  ),
                  //onChanged: (value) => model.lastName = value,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: 'Vache',
                  decoration: InputDecoration(
                    labelText: Home.lang_ar ? 'العنوان' : 'Title',
                    prefixIcon: Icon(
                      Icons.title,
                      color: Colors.green[200],
                    ),
                  ),
                  //onChanged: (value) => model.lastName = value,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  maxLines: 5,
                  initialValue: 'description vache',
                  decoration: InputDecoration(
                    labelText: Home.lang_ar ? 'وصف' : 'Description',
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      color: Colors.green[200],
                    ),
                  ),
                  //onChanged: (value) => model.lastName = value,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      'Change',
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

  void takePhoto1(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      imageFile1 = pickedFile;
    });
  }

  Widget bottomsheet1() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto1(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto1(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          )
        ],
      ),
    );
  }
}
