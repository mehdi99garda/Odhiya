import 'dart:ui';

import 'package:first_flutter_app/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/utils/form_helper.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  bool hidePassword = true;
  bool isApiCallProcess = false;
  APIService apiServices;

  String username;
  String password;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    apiServices = APIService();
    super.initState();
  }

  Widget _uiScreen() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: globalKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      Home.lang_ar ? 'تسجيل الدخول' : 'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[200],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlineButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                  Home.lang_ar
                                      ? 'تسجيل الدخول مع'
                                      : 'Login avec',
                                  style: TextStyle(color: Colors.green[300])),
                              SizedBox(width: 5),
                              Image.asset('images/logo_google.png',
                                  height: 20, width: 20)
                            ],
                          ),
                          borderSide:
                              BorderSide(width: 1, color: Colors.green[300]),
                        ),
                        SizedBox(width: 10),
                        OutlineButton(
                          onPressed: () async {
                            FacebookAuth.instance.login(permissions: [
                              "public_profile",
                              "email"
                            ]).then((value) {
                              FacebookAuth.instance
                                  .getUserData()
                                  .then((userData) {
                                setState(() {
                                  _isLoggedIn = true;
                                  _userObj = userData;
                                });
                              });
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                  Home.lang_ar
                                      ? 'تسجيل الدخول مع'
                                      : 'Login avec',
                                  style: TextStyle(color: Colors.green[300])),
                              SizedBox(width: 5),
                              Image.asset('images/logo_facebook.png',
                                  height: 20, width: 20)
                            ],
                          ),
                          borderSide:
                              BorderSide(width: 1, color: Colors.green[300]),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (!value.contains('@') || !value.endsWith('.com')) {
                          return 'Please Enter a valid Email';
                        }
                        if (value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: Home.lang_ar ? 'بريد إلكتروني' : 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green[200],
                        ),
                      ),
                      onChanged: (value) => username = value,
                    ),
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
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText:
                            Home.lang_ar ? ' كلمة المرور' : ' Mot De Passe',
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
                        child: Text(
                            Home.lang_ar ? 'تسجيل الدخول' : 'Se Connecter',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          var validate = globalKey.currentState.validate();
                          /*if (!validate) {
                            return Navigator.of(context).pushNamed('home');
                          }

                          setState(() {
                            isApiCallProcess = true;
                          });
                          var response =
                              await apiServices.loginCustomer(username, password);
                          setState(() {
                            isApiCallProcess = false;
                          });*/
                          if (validate) {
                            Home.isConnected = true;
                            //response.data != null
                            FormHelper.showMessage(
                                context, 'Done', 'Logged In Successfully', 'Ok',
                                () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (Home()),
                                ),
                              );
                            });
                          } else {
                            FormHelper.showMessage(context, 'Error!!',
                                'Something went wrong', 'Ok', () {
                              Navigator.of(context).pop();
                            });
                          }
                        },
                        color: Colors.green[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Home.lang_ar
                                ? "ليس لديك حساب ؟"
                                : "Vous n'avez pas de compte?",
                            style: TextStyle(color: Colors.green[300]),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('signup');
                            },
                            child: Text(
                              Home.lang_ar ? 'إنشاء حساب' : 'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[400]),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          child: _uiScreen(),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
