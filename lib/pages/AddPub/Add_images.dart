import 'dart:io';

import 'package:first_flutter_app/API/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:first_flutter_app/pages/api.dart';

class AddImages extends StatefulWidget {
  static PickedFile imageFile1;
  static PickedFile imageFile2;
  static PickedFile imageFile3;
  static PickedFile imageFile4;
  @override
  _AddImagesState createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text('صور (4 على الاكثر)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 1.6,
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                  image: DecorationImage(
                    image: AddImages.imageFile1 == null
                        ? AssetImage('')
                        : FileImage(File(AddImages.imageFile1.path)),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomsheet1()));
                      },
                      child:
                          Icon(Icons.camera_alt, color: Colors.red, size: 40)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                /*height: MediaQuery.of(context).size.width / 3 - 20,
                    width: MediaQuery.of(context).size.width / 3 - 20,*/
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                  image: DecorationImage(
                    image: AddImages.imageFile2 == null
                        ? AssetImage('')
                        : FileImage(File(AddImages.imageFile2.path)),
                    fit: BoxFit.cover,
                  ),
                  //image:
                ),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomsheet2()));
                      },
                      child:
                          Icon(Icons.camera_alt, color: Colors.grey, size: 40)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                /*height: MediaQuery.of(context).size.width / 3 - 20,
                    width: MediaQuery.of(context).size.width / 3 - 20,*/
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                  image: DecorationImage(
                    image: AddImages.imageFile3 == null
                        ? AssetImage('')
                        : FileImage(File(AddImages.imageFile3.path)),
                    fit: BoxFit.cover,
                  ),
                  //image:
                ),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomsheet3()));
                      },
                      child:
                          Icon(Icons.camera_alt, color: Colors.grey, size: 40)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                  image: DecorationImage(
                    image: AddImages.imageFile4 == null
                        ? AssetImage('')
                        : FileImage(File(AddImages.imageFile4.path)),
                    fit: BoxFit.cover,
                  ),
                  //image:
                ),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomsheet4()));
                      },
                      child:
                          Icon(Icons.camera_alt, color: Colors.grey, size: 40)),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: RaisedButton(
              color: Colors.teal,
              child: Text(
                'التالي',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () async {
                var res = await APIService.uploadSingleImage(
                    File(AddImages.imageFile1.path));
                print("hi");
                Navigator.of(context).pushNamed('part2_add_ad');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0))),
        ),
      ],
    );
  }

  void takePhoto1(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      AddImages.imageFile1 = pickedFile;
    });
  }

  void takePhoto2(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      AddImages.imageFile2 = pickedFile;
    });
  }

  void takePhoto3(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      AddImages.imageFile3 = pickedFile;
    });
  }

  void takePhoto4(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      AddImages.imageFile4 = pickedFile;
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

  Widget bottomsheet2() {
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
                    takePhoto2(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto2(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomsheet3() {
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
                    takePhoto3(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto3(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomsheet4() {
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
                    takePhoto4(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto4(ImageSource.gallery);
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
