import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
import 'package:woocomerce_app/api_service.dart';
import 'package:woocomerce_app/models/customer.dart';
import 'package:woocomerce_app/utils/form_helper.dart';
import 'package:woocomerce_app/utils/progressHUD.dart';
import 'package:woocomerce_app/utils/validator_service.dart';*/
/*
class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  /*APIService apiService;
  CustomerModel model;*/
  GlobalKey<FormState> globalkey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  @override
  void initState() {
    /*apiService = new APIService();
    model = new CustomerModel();*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          automaticallyImplyLeading: true,
          title: Text("sign Up"),
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
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormHelper.fieldLabel("First Name"),
                        FormHelper.textInput(
                          context,
                          model.firstName,
                          (value) => {
                            this.model.firstName = value,
                          },
                          onValidate: (value) {
                            if (value.toString().isEmpty) {
                              return "please enter first Name";
                            }
                            return null;
                          },
                        ),
                        // last name
                        FormHelper.fieldLabel("Last Name"),
                        FormHelper.textInput(
                          context,
                          model.lastName,
                          (value) => {
                            this.model.lastName = value,
                          },
                          onValidate: (value) {
                            if (value.toString().isEmpty) {
                              return "please enter last Name";
                            }
                            return null;
                          },
                        ),
                        // email
                        FormHelper.fieldLabel("Email Id"),
                        FormHelper.textInput(
                          context,
                          model.email,
                          (value) => {
                            this.model.email = value,
                          },
                          onValidate: (value) {
                            if (value.toString().isEmpty) {
                              return "please enter email id";
                            }
                            /*if (value.isNotEmpty &&
                                !value.toString().isValidEmail()) {
                              return 'Please enter valid email id';
                            }*/
                            //ligne 94 95 du code min 19.24 , valid email / une condition
                          },
                        ),
                        //password
                        FormHelper.fieldLabel("Password"),
                        FormHelper.textInput(
                            context,
                            model.password,
                            (value) => {
                                  this.model.password = value,
                                }, onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "please enter Password";
                          }
                          return null;
                        },
                            obscureText: hidePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        new Center(
                            child: FormHelper.saveButton("register", () {
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
                        }))
                      ],
                    )))));
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
*/
