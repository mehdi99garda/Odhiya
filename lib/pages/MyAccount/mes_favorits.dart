import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Home.dart';

class MesFavorits extends StatefulWidget {
  @override
  _MesFavoritsState createState() => _MesFavoritsState();
}

class _MesFavoritsState extends State<MesFavorits> {
  PickedFile imageFile1;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCardCart('images/cow1.jpg', 'title', '3000'),
        _buildCardCart('images/chevre1.jpg', 'title', '3000'),
        _buildCardCart('images/mouton1.jpg', 'title', '3000'),
        _buildCardCart('images/mouton2.jpg', 'title', '3000'),
      ],
    );
  }

  Widget _buildCardCart(String imgPath, String title, String price) {
    return InkWell(
      onTap: () {
        //Navigator.of(context).pushNamed('annonce');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(color: Colors.green),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 90,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: Home.lang_ar
                          ? BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))
                          : BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  height: 80,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(title),
                      Text(price + (Home.lang_ar ? ' د.م ' : ' DH'),
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 20,
                  elevation: 0,
                  color: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 30,
                  ),
                  shape: CircleBorder(),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                              title: Text('remove from favorite ?'),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('No',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue))),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue))),
                              ],
                            ));
                  },
                ),
              ],
            )),
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
