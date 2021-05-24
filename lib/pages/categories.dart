import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_flutter_app/pages/Home.dart';
import 'package:first_flutter_app/widgets/widget_categories_product.dart';
import 'package:first_flutter_app/widgets/widget_home_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool select_mouton = true;
  bool select_vache = false;
  bool select_chevre = false;

  List animals_fr = ['Moutons', 'Vaches', 'Chevres'];
  List animals_ar = ['خروف', 'ابقار', 'ماعز'];
  List animals;

  @override
  Widget build(BuildContext context) {
    Home.lang_ar ? animals = animals_ar : animals = animals_fr;
    return ListView(
      children: [
        SizedBox(height: 3),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: Text(animals[0],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                selected: select_mouton,
                selectedColor: Colors.black,
                onSelected: (bool selected) {
                  setState(() {
                    select_chevre = false;
                    select_vache = false;
                    select_mouton = true;
                  });
                },
              ),
              ChoiceChip(
                  label: Text(animals[1],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  selected: select_vache,
                  selectedColor: Colors.black,
                  onSelected: (bool selected) {
                    setState(() {
                      select_chevre = false;
                      select_vache = true;
                      select_mouton = false;
                    });
                  }),
              ChoiceChip(
                  label: Text(animals[2],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  selected: select_chevre,
                  selectedColor: Colors.black,
                  onSelected: (bool selected) {
                    setState(() {
                      select_chevre = true;
                      select_vache = false;
                      select_mouton = false;
                    });
                  }),
            ],
          ),
        ),
        SizedBox(height: 5),
        if (select_mouton) ...[
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: WidgetCategorieProducts(tagId: Config.mouton),
          )
        ],
        if (select_vache) ...[
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: WidgetCategorieProducts(tagId: Config.vache),
          )
        ],
        if (select_chevre) ...[
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: WidgetCategorieProducts(tagId: Config.chevre_fr),
          )
        ],
      ],
    );
  }

  Widget _buildListCard(String imgPath, String price) {
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
                  image: AssetImage(imgPath),
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
                        child:
                            Text(price, style: TextStyle(color: Colors.white))),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildCardColumn(String imgPath, String title, String description,
      String price, bool added, bool favorite, context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('annonce');
      },
      child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Ink.image(
                image: AssetImage(imgPath),
                height: 110,
                width: 140,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Row(
                          children: [
                            Icon(Icons.add_shopping_cart, color: Colors.white),
                            Text(
                              'اضافة الى سلتي',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: favorite
                            ? InkWell(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  setState(() {
                                    favorite = false;
                                  });
                                },
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  setState(() {
                                    favorite = true;
                                  });
                                },
                              ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
