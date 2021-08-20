import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/product.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget {
  MyApp1({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp1> {
  APIService _apiService = new APIService();
  final TextEditingController _controller = TextEditingController();
  //Future<CustomerDetailsModel> _model;
  // CustomerDetailsModel _model = new CustomerDetailsModel();
  // OrdersModel _ordersModel = new OrdersModel();
  // ShippingModel ship = new ShippingModel();
  Product model = new Product();
  List<Object> images = [];

  @override
  void initState() {
    super.initState();
    this.model = new Product();
    this.model.images = [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          //_model = _apiService.ship(model);
          child: /*(_model == null) */ buildColumn(), //: buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter  name of product '),
          onChanged: (value) {
            setState(() {
              this.model.name = value;
            });
          },
        ),
        TextField(
          // controller: _controller,
          decoration: InputDecoration(hintText: 'Enter price'),
          onChanged: (value) {
            setState(() {
              this.model.price = value;
            });
          },
        ),
        //
        MultiImagePicker(
          totalImages: 1,
          imageSource: ImagePickSource.gallery,
          initialValue: this
              .model
              .images
              .map((e) => e.src)
              .toList(), //for showing images from collection
          onImageChanged: (images) {
            this.images = images;
          },
        ),
        ElevatedButton(onPressed: () {
          if (images.length > 0) {
            this.model.images = [];
            images.forEach((img) {
              if (img is ImageUploadModel) {
                if (img.imageUrl == null) {
                  this.model.images.add(new Images(src: img.imageFile));
                } else {
                  this.model.images.add(new Images(src: img.imageUrl));
                }
              }
            });
          }
          var product_Provider =
              Provider.of<CartProvider>(context, listen: false);
          product_Provider.createProduct(this.model, (val) {});

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => OrdersScreen())
        })
//           //
      ],
    );
  }
}
