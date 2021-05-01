import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
=======
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
>>>>>>> 37bef64 (product detail integration)

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
<<<<<<< HEAD
=======
  bool _isLoggedIn = false;
  Map _userObj = {};

  bool isRememberMe = false;
  bool hidePassword = true;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)
              ]),
          height: 50,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color(0xffb2d4cd)),
                hintText: 'Email'),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)
              ]),
          height: 50,
          child: TextField(
            obscureText: hidePassword,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Color(0xffb2d4cd),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xffb2d4cd)),
                hintText: 'Password'),
          ),
        )
      ],
    );
  }

>>>>>>> 37bef64 (product detail integration)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
<<<<<<< HEAD
                        Color(0xffb2d4cd),
                        Color(0xffb2d4cd),
                        Color(0xffb2d4cd),
                        Color(0xffb2d4cd),
=======
                        Color(0x66b2d4cd),
                        Color(0x99b2d4cd),
                        Color(0xccb2d4cd),
                        Color(0xffb2d4cd),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Odhiya',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlineButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text('Login with',
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 5),
                                    Image.asset('images/logo_google.png',
                                        height: 20, width: 20)
                                  ],
                                ),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white),
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
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 5),
                                    Image.asset('images/logo_facebook.png',
                                        height: 20, width: 20)
                                  ],
                                ),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
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
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14),
                                    prefixIcon: Icon(Icons.email,
                                        color: Color(0xffb2d4cd)),
                                    hintText: 'Email'),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                obscureText: hidePassword,
                                style: TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      color: Color(0xffb2d4cd),
                                      icon: Icon(
                                        hidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14),
                                    prefixIcon: Icon(Icons.lock,
                                        color: Color(0xffb2d4cd)),
                                    hintText: 'Password'),
                              ),
                            )
                          ],
                        ),
                        //forget password
                        Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.only(right: 0),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        //remember me
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: Checkbox(
                                    value: isRememberMe,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        isRememberMe = value;
                                      });
                                    },
                                  )),
                              Text('Remember me',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        //button login
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5,
                            onPressed: () {},
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.white,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xffb2d4cd)),
                            ),
                          ),
                        ),
                        //link signup
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an Account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('signup');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
>>>>>>> 37bef64 (product detail integration)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
