import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool viasble = true;
  var w = Colors.black;
  var b = Colors.black;
  var bl = Colors.blue;
  var t = Colors.blue;
  var g = Colors.blue;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  String email, password;

  bool _loading;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("LAPSTORE"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/kk.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0 , vertical: 95),
              color: Colors.white60.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: TextField(
                      controller: emailcontroller,
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: t),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          labelText: "email",
                          labelStyle: TextStyle(color: w),
                          icon: Icon(
                            Icons.email_outlined,
                            color: bl,
                          ),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: w)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: passwordcontroller,
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: t),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        labelText: "password",
                        labelStyle: TextStyle(color: w),
                        icon: Icon(Icons.adjust, color: bl),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viasble ? Icons.visibility : Icons.visibility_off,
                            color: bl,
                          ),
                          onPressed: () {
                            setState(() {
                              viasble = !viasble;
                            });
                          },
                        ),
                        hintText: 'Enter your password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: viasble,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      textColor: w,
                      color: t,
                      child: Text(
                        "Login",
                        style: TextStyle(color: w),
                      ),
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                          );
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('email', emailcontroller.text);
                            Navigator.of(context).pushNamed('CategoriesScreen');

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found' ) {
                            final a = AlertDialog(
                              title: Text(
                                'No user found for that email.',
                              ),
                              content: Container(
                                child: RaisedButton(
                                  color: Colors.blue,
                                  child: Text('close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            );
                            showDialog(context: context, child: a);
                          }
                          else if (e.code == 'wrong-password') {
                            final a = AlertDialog(
                              title: Text(
                                  'Wrong password provided for that user.'),
                              content: Container(
                                child: RaisedButton(
                                  child: Text('close'),
                                  color: Colors.blue,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            );
                            showDialog(context: context, child: a);
                          }
                          else if(e.code!=null){
                            final a=AlertDialog(title: Text('enter your email and password' ) , content: Container(child: RaisedButton(
                              color: Colors.blue,
                              child: Text('close'),
                              onPressed: () {
                                Navigator.of(context).pop();

                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            ),
                            );
                            showDialog(context: context , child: a);
                          }
                        }
                      },
                    ),
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

