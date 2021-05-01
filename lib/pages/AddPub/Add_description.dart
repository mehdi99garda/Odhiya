import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionAd extends StatefulWidget {
  @override
  _DescriptionAdState createState() => _DescriptionAdState();
}

class _DescriptionAdState extends State<DescriptionAd> {
  List animals_fr = ['Vache', 'Mouton', 'Chevre'];
  String valuechoose_fr = 'Vache';
  List animals_ar = ['بقرة', 'كبش', 'ماعز'];
  String valuechoose_ar = 'بقرة';

  //moutons
  List moutons = ['sardi', 'damane', 'timahdite', 'wjdiya'];
  String valuechoose_mouton = 'sardi';
  List taille_mouton = ['Brebis', 'mouton', 'agneau'];
  String valuechoose_mouton_taille = 'Brebis';
  //end moutons

  //Vaches
  List vaches = [
    'houlshteine',
    'shaghouri',
    'beligiki bleu',
    'Montebiliarde',
    'Limousine',
    'croissee'
  ];
  String valuechoose_vache = 'houlshteine';
  List taille_vaches = ['boeuf', 'vache', 'taureau'];
  String valuechoose_vaches_taille = 'taureau';
  //end moutons

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 30,
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 20,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Text('شكرا لاختياركم اضحية لوضع اعلانكم بها',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(right: 16, left: 16),
                padding: EdgeInsets.only(right: 10, left: 10),
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
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
              if (valuechoose_ar == 'بقرة') ...[
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                      padding: EdgeInsets.only(right: 10, left: 10),
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
                        value: valuechoose_vache,
                        items: vaches.map((valuechoose_vache) {
                          return DropdownMenuItem(
                              value: valuechoose_vache,
                              child: Text(
                                valuechoose_vache,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valuechoose_vache = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                      padding: EdgeInsets.only(right: 10, left: 10),
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
                        value: valuechoose_vaches_taille,
                        items: taille_vaches.map((valuechoose_vaches_taille) {
                          return DropdownMenuItem(
                              value: valuechoose_vaches_taille,
                              child: Text(
                                valuechoose_vaches_taille,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valuechoose_vaches_taille = value;
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
              if (valuechoose_ar == 'كبش') ...[
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 16, left: 16),
                      padding: EdgeInsets.only(right: 10, left: 10),
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
                        value: valuechoose_mouton,
                        items: moutons.map((valuechoose_mouton) {
                          return DropdownMenuItem(
                              value: valuechoose_mouton,
                              child: Text(
                                valuechoose_mouton,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valuechoose_mouton = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                      padding: EdgeInsets.only(right: 10, left: 10),
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
                        value: valuechoose_mouton_taille,
                        items: taille_mouton.map((valuechoose_mouton_taille) {
                          return DropdownMenuItem(
                              value: valuechoose_mouton_taille,
                              child: Text(
                                valuechoose_mouton_taille,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valuechoose_mouton_taille = value;
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
              if (valuechoose_ar == 'ماعز') ...[
                Container(
                    margin: EdgeInsets.only(right: 16, left: 16, top: 20),
                    padding: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ]),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          hintText: 'Lbore'),
                    ))
              ],
              SizedBox(height: 30),
              Positioned(
                bottom: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        'التالي',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('part3_add_ad');
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
