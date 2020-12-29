import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yarab/dummy.dart';
import 'package:yarab/models/laps.dart';
import 'package:yarab/screens/Signup.dart';
import 'package:yarab/screens/card_screen.dart';
import 'package:yarab/screens/categories_laps_screen.dart';
import 'package:yarab/screens/drawer_screen.dart';
import 'package:yarab/screens/lap_details_screen.dart';
import 'package:yarab/screens/login.dart';
import 'package:yarab/screens/setting%20screen.dart';
import 'package:yarab/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import 'package:http/http.dart' as http;
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(),

      routes: {
        'homepage': (context) => MyHomePage(),
        'CategoriesScreen': (context) => CategoriesScreen(),
        'Categorieslapscreen' : (context) => Categorieslapscreen(),
        'lapdetailsscreen' : (context) => LapDetails(),
        'cardscreen' : (context) => CardScreen(),
        'drawer' : (context) => DrawerScreen(),
        'cart' : (context) => CardScreen(),
        'setting' : (context) => Setting(),
        'Signup' : (context) => Signup(),
        'Login' : (context) => Login(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List <Laps> cartlap=[];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Signup(),
    );
  }

}
