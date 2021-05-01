import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/customer.dart';
import 'package:first_flutter_app/API/utils/form_helper.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/API/utils/validator_service.dart';

import 'Home.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoggedIn = false;
  Map _userObj = {};
  /*String username;
  String password;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
*/
  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalkey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: ProgressHUD(
          child: new Form(
            key: globalkey,
            child: _formUI(),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ));
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.person_sharp,
                          color: Colors.green[200],
                        ),
                      ),
                      onChanged: (value) => model.firstName = value,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.person_sharp,
                          color: Colors.green[200],
                        ),
                      ),
                      onChanged: (value) => model.lastName = value,
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
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green[200],
                        ),
                      ),
                      onChanged: (value) => model.email = value,
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
                      onChanged: (value) => model.password = value,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                        child: Text('Creer Compte',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onPressed: () {
                          if (validateAndSave()) {
                            print(model.toJson());
                            setState(() {
                              isApiCallProcess = true;
                              print("good");
                            });

                            apiService.creatCustomer(model).then((ret) {
                              setState(() {
                                isApiCallProcess = false;
                                print("good1");
                              });

                              if (ret) {
                                FormHelper.showMessage(
                                  context,
                                  "woocommerce App",
                                  "Registraction Successfull",
                                  "Ok",
                                  () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              } else {
                                FormHelper.showMessage(
                                    context,
                                    "woocommerce App",
                                    "Email Id already registred",
                                    "OK", () {
                                  Navigator.of(context).pop();
                                });
                              }
                            });
                          }
                        },
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
    );
  }

  bool validateAndSave() {
    final form = globalkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
