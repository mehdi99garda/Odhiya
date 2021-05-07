import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/category.dart' as categoryModel;
import 'package:first_flutter_app/API/models/product.dart';
//import 'package:first_flutter_app/provider/products_provider.dart';

class WidgetCategorieProducts extends StatefulWidget {
  WidgetCategorieProducts({Key key, this.tagId}) : super(key: key);

  //String labelName;
  String tagId;

  @override
  _WidgetCategorieProductsState createState() =>
      _WidgetCategorieProductsState();
}

class _WidgetCategorieProductsState extends State<WidgetCategorieProducts> {
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
      padding: EdgeInsets.only(top: 5, left: 1, right: 1, bottom: 1),
      height: 110,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: itemes.length,
        itemBuilder: (context, index) {
          var data = itemes[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('annonce');
            },
            child: Center(
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 110,
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
                      bottom: -1,
                      right: 10,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              color: Colors.teal,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
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
