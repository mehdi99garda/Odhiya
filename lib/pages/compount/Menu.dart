import 'package:first_flutter_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  String valuechoose = "العربية";
  List languages = ['العربية', 'الفرنسية'];
  String valuecustomer = "شاري";
  List customer = ['شاري', 'بائع']; //تحويل الى
  String test = '0';
  bool isConnected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Colors.black.withOpacity(0.3), //Colors.teal[200],
      child: ListView(
        children: [
          Expanded(
            flex: 20,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isConnected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              onPressed: () {},
                              child: Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.teal,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 6),
                                          Icon(
                                            Icons.person_sharp,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      width: 150,
                                      child: Text('الاسم',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            //SizedBox(width: 100),
                            FlatButton(
                              child: Row(
                                children: [
                                  Icon(Icons.storefront, color: Colors.white),
                                  SizedBox(width: 5),
                                  DropdownButton(
                                    dropdownColor:
                                        Colors.black.withOpacity(0.5),
                                    value: valuecustomer,
                                    items: customer.map((valuecustomer) {
                                      return DropdownMenuItem(
                                          value: valuecustomer,
                                          child: Text(
                                            valuecustomer,
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ));
                                    }).toList(),
                                    onChanged: (value) {
                                      valuecustomer = value;
                                      setState(() {
                                        valuecustomer = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : FlatButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.teal,
                                child: Column(
                                  children: [
                                    SizedBox(height: 6),
                                    Icon(
                                      Icons.person_sharp,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 15),
                              Text('تسجيل الدخول',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            title: DropdownButton(
              dropdownColor: Colors.black.withOpacity(0.5),
              value: valuechoose,
              items: languages.map((valuechoose) {
                return DropdownMenuItem(
                    value: valuechoose,
                    child: Text(
                      valuechoose,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ));
              }).toList(),
              onChanged: (value) {
                valuechoose = value;
                setState(() {
                  valuechoose = value;
                });
              },
            ),
            leading: Icon(
              Icons.translate,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('اضف اعلان',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
            onTap: () {
              setState(() {
                selectedIndex = 2;
                return MyApp();
              });
            },
          ),
          ListTile(
            title: Text('مناسبات',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('فئات',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.list_alt,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('اتصل بنا',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.call,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('معلومات عنا',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('شروط الاستعمال',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.assignment_outlined,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('كيفية الاستعمال',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            leading: Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
