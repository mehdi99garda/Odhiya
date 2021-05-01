import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool select_mouton = true;
  bool select_vache = false;
  bool select_chevre = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(
                  label: Text('Moutons', style: TextStyle(color: Colors.white)),
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
                    label:
                        Text('Vaches', style: TextStyle(color: Colors.white)),
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
                    label:
                        Text('Chevres', style: TextStyle(color: Colors.white)),
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
          SizedBox(height: 20),
          Container(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  /*height: MediaQuery.of(context).size.width / 3 - 20,
                    width: MediaQuery.of(context).size.width / 3 - 20,*/
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                    image: DecorationImage(
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                    //image:
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.camera_alt,
                            color: Colors.grey, size: 40)),
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
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                    //image:
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.camera_alt,
                            color: Colors.grey, size: 40)),
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
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                    //image:
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.camera_alt,
                            color: Colors.grey, size: 40)),
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
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                    //image:
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.camera_alt,
                            color: Colors.grey, size: 40)),
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
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                    //image:
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.camera_alt,
                            color: Colors.grey, size: 40)),
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
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                    //image:
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.camera_alt,
                            color: Colors.grey, size: 40)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
