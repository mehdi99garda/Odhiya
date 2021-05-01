import 'dart:ui';

<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_woocomerce/pages/home_page.dart';
import 'package:flutter_woocomerce/utlils/form_helper.dart';
import 'package:flutter_woocomerce/utlils/progressHUD.dart';
import '../api_service.dart';
=======
import 'package:first_flutter_app/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/utils/form_helper.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
>>>>>>> 37bef64 (product detail integration)

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
<<<<<<< HEAD
  bool hidePassword = true;
  bool isApiCallProcess = false;
  APIServices apiServices;
=======
  bool _isLoggedIn = false;
  Map _userObj = {};

  bool hidePassword = true;
  bool isApiCallProcess = false;
  APIService apiServices;
>>>>>>> 37bef64 (product detail integration)

  String username;
  String password;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
<<<<<<< HEAD
    apiServices = APIServices();
=======
    apiServices = APIService();
>>>>>>> 37bef64 (product detail integration)
    super.initState();
  }

  Widget _uiScreen() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
<<<<<<< HEAD
          padding: EdgeInsets.only(top: 140, right: 10, left: 10),
=======
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 10),
>>>>>>> 37bef64 (product detail integration)
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: globalKey,
              child: Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.all(40),
=======
                padding: const EdgeInsets.all(20),
>>>>>>> 37bef64 (product detail integration)
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
<<<<<<< HEAD
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
=======
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
                              Text('Login with',
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
                              Text('Login with',
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
>>>>>>> 37bef64 (product detail integration)
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
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
<<<<<<< HEAD
                          color: Colors.redAccent,
=======
                          color: Colors.green[200],
>>>>>>> 37bef64 (product detail integration)
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
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
<<<<<<< HEAD
                          color: Colors.redAccent,
=======
                          color: Colors.green[200],
>>>>>>> 37bef64 (product detail integration)
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
<<<<<<< HEAD
                                ? Icons.visibility
                                : Icons.visibility_off,
=======
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.green[200],
>>>>>>> 37bef64 (product detail integration)
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: Text('Login'),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        var validate = globalKey.currentState.validate();
                        if (!validate) {
                          return;
                        }
                        setState(() {
                          isApiCallProcess = true;
                        });
                        var response =
                            await apiServices.loginCustomer(username, password);
                        setState(() {
                          isApiCallProcess = false;
                        });
                        if (response.data != null) {
                          FormHelper.showMessage(
                              context, 'Done', 'Logged In Successfully', 'Ok',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (HomePage()),
                              ),
                            );
                          });
                        } else {
                          FormHelper.showMessage(
                              context, 'Error!!', 'Something went wrong', 'Ok',
                              () {
                            Navigator.of(context).pop();
                          });
                        }
                      },
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
=======
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        child: Text('Se Connecter',
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
                            "Don't have an Account?",
                            style: TextStyle(color: Colors.green[300]),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('signup');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[400]),
                            ),
                          )
                        ],
                      ),
                    )
>>>>>>> 37bef64 (product detail integration)
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
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.redAccent,
=======
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
>>>>>>> 37bef64 (product detail integration)
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        child: _uiScreen(),
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
