import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Map<String, dynamic> formData;
  List animals_fr = ['Vaches', 'Moutons', 'Chevres'];
  String valuechoose_fr = 'Vaches';
  List animals_ar = ['ابقار', 'اكباش', 'ماعز'];
  String valuechoose_ar = 'ابقار';
  double lowValue = 1;
  double highValue = 1000;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'بحث',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(175, 182, 179, 0.5),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            color: Color.fromRGBO(175, 182, 179, 0.5),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ]),
                    height: 50,
                    child: TextField(
                      style: TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xffb2d4cd)),
                          hintText: 'بحث....'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ]),
                    child: DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      elevation: 0,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: valuechoose_ar,
                      items: animals_ar.map((valuechoose_ar) {
                        return DropdownMenuItem(
                            value: valuechoose_ar,
                            child: Text(
                              valuechoose_ar,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center,
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          valuechoose_ar = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ]),
                    height: 50,
                    child: TextField(
                      style: TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(Icons.location_city,
                              color: Color(0xffb2d4cd)),
                          hintText: 'المدينة'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(lowValue.toString() + ' د.م ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(highValue.toString() + ' د.م ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      RangeSlider(
                          min: 0.0,
                          max: 1000.0,
                          divisions: 20,
                          values: RangeValues(lowValue, highValue),
                          onChanged: (_range) {
                            setState(() {
                              lowValue = _range.start;
                              highValue = _range.end;
                            });
                          }),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
