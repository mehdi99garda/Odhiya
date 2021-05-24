import 'dart:io';

import 'package:first_flutter_app/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class MesInfos extends StatefulWidget {
  @override
  _MesInfosState createState() => _MesInfosState();
}

class _MesInfosState extends State<MesInfos> {
  PickedFile imageFile1;
  final ImagePicker _picker = ImagePicker();
  bool _isLoggedIn = false;
  Map _userObj = {};
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(40),
                image: !_isLoggedIn
                    ? DecorationImage(
                        image: imageFile1 == null
                            ? AssetImage('')
                            : FileImage(File(imageFile1.path)),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(_userObj["picture"]["data"]["url"]),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              initialValue: 'Mehdi', //!_isLoggedIn ? '' : _userObj["name"],
              decoration: InputDecoration(
                labelText: Home.lang_ar ? 'الاسم' : 'Name',
                prefixIcon: Icon(
                  Icons.person_sharp,
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
              initialValue:
                  'name@domaine.com', //!_isLoggedIn ? '' : _userObj["email"],
              validator: (value) {
                if (!value.contains('@') || !value.endsWith('.com')) {
                  return 'Please Enter a valid Email';
                }
                if (value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: Home.lang_ar ? 'بريد إلكتروني' : 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.green[200],
                ),
              ),
              //onChanged: (value) => model.email = value,
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
          SizedBox(height: 15),
          FlatButton(
            child: Text(
                Home.lang_ar ? 'تغيير كلمة المرور' : 'Changer Mot De Passe',
                style: TextStyle(color: Colors.blue, fontSize: 16)),
            onPressed: () {
              Navigator.of(context).pushNamed('updatePassword');
            },
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: RaisedButton(
                color: Colors.teal,
                child: Text(
                  Home.lang_ar ? 'تحديث' : 'Change',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0))),
          )
        ],
      ),
    );
  }

  void takePhoto1(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _isLoggedIn = false;
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
