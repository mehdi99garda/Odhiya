import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:woocomerce_app/API/api_service.dart';
import 'package:woocomerce_app/API/models/category.dart' as categoryModel;
import 'package:woocomerce_app/API/models/product.dart';
import 'package:woocomerce_app/provider/products_provider.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({Key key, this.labelName, this.tagId}) : super(key: key);

  String labelName;
=======
import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/category.dart' as categoryModel;
import 'package:first_flutter_app/API/models/product.dart';
//import 'package:first_flutter_app/provider/products_provider.dart';
import 'package:first_flutter_app/pages/compount/Annonce.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({Key key, this.tagId}) : super(key: key);

  //String labelName;
>>>>>>> 37bef64 (product detail integration)
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
<<<<<<< HEAD
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
=======
    return Container(color: Colors.white, child: _productsList());
>>>>>>> 37bef64 (product detail integration)
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
<<<<<<< HEAD
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
=======
      padding: EdgeInsets.only(top: 5, left: 5, right: 80, bottom: 5),
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemes.length,
        itemBuilder: (context, index) {
          var data = itemes[index];
          return InkWell(
            onTap: () {
              /* Navigator.of(context).pushNamed(
                'annonce',
              );*/
              // modification
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Annonce(
                            product: data,
                          )));
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
>>>>>>> 37bef64 (product detail integration)
  }
}
