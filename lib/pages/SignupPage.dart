import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/models/customer.dart';
import 'package:first_flutter_app/API/utils/form_helper.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/API/utils/validator_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Home.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  PickedFile imageFile1;
  final ImagePicker _picker = ImagePicker();
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
    return Directionality(
      textDirection: Home.lang_ar ? TextDirection.rtl : TextDirection.ltr,
      child: new Scaffold(
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
          )),
    );
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlineButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                  Home.lang_ar ? 'سجل مع' : 'se connecter avec',
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
                                  Home.lang_ar ? 'سجل مع' : 'se connecter avec',
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
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(15),
                              image: !_isLoggedIn
                                  ? DecorationImage(
                                      image: imageFile1 == null
                                          ? AssetImage('')
                                          : FileImage(File(imageFile1.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(
                                          _userObj["picture"]["data"]["url"]),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                              bottom: -1,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) =>
                                              bottomsheet1()));
                                    },
                                    child: Icon(Icons.camera_alt,
                                        color: Colors.grey, size: 30)),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: !_isLoggedIn ? '' : _userObj["name"],
                      decoration: InputDecoration(
                        labelText: Home.lang_ar ? 'الاسم' : 'Name',
                        prefixIcon: Icon(
                          Icons.person_sharp,
                          color: Colors.green[200],
                        ),
                      ),
                      onChanged: (value) => model.lastName = value,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: !_isLoggedIn ? '' : _userObj["email"],
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
                            Home.lang_ar ? 'إنشاء حساب' : 'Créer Compte',
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

  void takePhoto1(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _isLoggedIn = false;
      imageFile1 = pickedFile;
    });
  }

  Widget bottomsheet1() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto1(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto1(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          )
        ],
      ),
    );
  }
}
