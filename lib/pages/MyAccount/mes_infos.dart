import 'dart:io';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(50),
                    image: !_isLoggedIn
                        ? DecorationImage(
                            image: imageFile1 == null
                                ? AssetImage('')
                                : FileImage(File(imageFile1.path)),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: NetworkImage(
                                _userObj["picture"]["data"]["url"]),
                            fit: BoxFit.cover,
                          ),
                  ),
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
                          borderRadius: BorderRadius.circular(20)),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'email@domaine.com',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
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
