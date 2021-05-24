import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class UpdatePassword extends StatefulWidget {
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool hidePassword = true;
  String old_password;
  String new_password;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
          backgroundColor: Colors.green[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Form(
                      //key: globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              Home.lang_ar
                                  ? 'تغيير كلمة المرور'
                                  : 'Changer Mot De Passe',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[200],
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: hidePassword,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                if (value.length < 6) {
                                  return 'Password is Too Short';
                                }
                                return null;
                              },
                              onChanged: (value) => old_password = value,
                              decoration: InputDecoration(
                                labelText: Home.lang_ar
                                    ? "كلمة المرور القديمة"
                                    : "Ancien mot de passe",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.green[200],
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.green[200],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: hidePassword,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                if (value.length < 6) {
                                  return 'Password is Too Short';
                                }
                                return null;
                              },
                              onChanged: (value) => new_password = value,
                              decoration: InputDecoration(
                                labelText: Home.lang_ar
                                    ? 'كلمة السر الجديدة'
                                    : 'Nouveau mot de passe',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.green[200],
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.green[200],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                child: Text(Home.lang_ar ? 'تحديث' : 'Change',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                onPressed: () async {},
                                color: Colors.green[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
