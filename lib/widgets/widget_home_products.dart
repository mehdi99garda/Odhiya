import 'package:first_flutter_app/pages/compount/Annonce.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/category.dart' as categoryModel;
import 'package:first_flutter_app/API/models/product.dart';
//import 'package:first_flutter_app/provider/products_provider.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({Key key, this.tagId, this.data}) : super(key: key);

  //String labelName;
  String tagId;
  Product data;

  @override
  _WidgetHomeProductsState createState() => _WidgetHomeProductsState();
}

class _WidgetHomeProductsState extends State<WidgetHomeProducts> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: _productsList());
  }

  Widget _productsList() {
    return new FutureBuilder(
        future: apiService.getProducts(tagName: this.widget.tagId),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
          if (model.hasData) {
            return _buildList(model.data);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildList(List<Product> itemes) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemes.length,
        itemBuilder: (context, index) {
          var data = itemes[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Annonce(product: data)));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Stack(
                children: [
                  Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(data.images[0].src),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 0,
                      right: 10,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: 80,
                          height: 25,
                          child: Center(
                              child: Text('${data.salePrice}' + ' د.م',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
