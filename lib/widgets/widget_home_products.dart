import 'package:flutter/material.dart';
import 'package:woocomerce_app/API/api_service.dart';
import 'package:woocomerce_app/API/models/category.dart' as categoryModel;
import 'package:woocomerce_app/API/models/product.dart';
import 'package:woocomerce_app/provider/products_provider.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({Key key, this.labelName, this.tagId}) : super(key: key);

  String labelName;
  String tagId;

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
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 16, top: 4),
                    child: Text(/*'All Categories'*/ this.widget.labelName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
            ),
            _productsList()
          ],
        ));
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
        height: 150,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemes.length,
          itemBuilder: (context, index) {
            var data = itemes[index];
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: 130,
                    height: 120,
                    alignment: Alignment.center,
                    child: Image.network(
                      data.images[0].src,
                      height: 120,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 15),
                      ],
                    )),
                //modification start
                Container(
                    width: 130,
                    alignment: Alignment.centerLeft,
                    child: Text(data.name,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ))),
                Container(
                    margin: EdgeInsets.only(top: 4, left: 4),
                    width: 130,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text('${data.regularPrice}',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            )),
                        //2
                        Text('${data.salePrice}',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ))

                //end modification
                /* Row(
                  children: [
                    Text(data.categoryName.toString()),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 14,
                    )
                  ],
                )*/
              ],
            );
          },
        ));
  }
}
