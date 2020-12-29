import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool viasble = true;
  var w = Colors.black;
  var b = Colors.black;
  var bl = Colors.blue;
  var t = Colors.blue;
  var g = Colors.blue;
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  bool showProgress = false;
  String email, password;
  final _auth = FirebaseAuth.instance;
  String str = "email";
  final GlobalKey<FormState> gk = GlobalKey();

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
            child:Container(
              margin: EdgeInsets.symmetric(horizontal: 0 , vertical: 70),
              color: Colors.white60.withOpacity(0.2),
              child: Column(
                key: gk,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      controller: namecontroller,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'please type your name';
                        }
                      },
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: t),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          labelText: 'name',
                          labelStyle: TextStyle(color: w),
                          icon: Icon(
                            Icons.person_add_alt_1_outlined,
                            color: bl,
                          ),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(color: w)),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'please type an email';
                        }
                      },
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: t),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          labelText: str,
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
                    child: TextFormField(
                      controller: passwordcontroller,
                      validator: (input) {
                        if (input.length >= 6) {
                          return 'at least 6 character';
                        }
                      },
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
                    child: TextField(
                      controller: phonecontroller,
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: t),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          labelText: 'phone',
                          labelStyle: TextStyle(color: w),
                          icon: Icon(
                            Icons.phone,
                            color: bl,
                          ),
                          hintText: 'Enter your number',
                          hintStyle: TextStyle(color: w)),
                      keyboardType: TextInputType.phone,
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
                          "Sign up",
                          style: TextStyle(color: w),
                        ),
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                            );
                              Navigator.of(context).pushNamed("CategoriesScreen");
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              final a=AlertDialog(title: Text('The password provided is too weak',  ) , content: Container(child: RaisedButton(
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

                            else if (e.code == 'email-already-in-use') {
                              final a=AlertDialog(title: Text('The account already exists for that email.' ) , content: Container(child: RaisedButton(
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
                            else if(e.code!=null){
                              final a=AlertDialog(title: Text('fill this form') , content: Container(child: RaisedButton(
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
                          } catch (e) {
                            print(e);
                          }
                        }),
                  ),
                  Container(
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pushNamed('Login');
                          });
                        },
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(color: w),
                        )),
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
