import 'package:yarab/dummy.dart';
import 'package:yarab/models/laps.dart';
import 'package:yarab/screens/card_screen.dart';
import 'package:yarab/screens/categories_laps_screen.dart';
import 'package:yarab/screens/categories_screen.dart';
import 'package:yarab/screens/drawer_screen.dart';
import 'package:yarab/screens/lap_details_screen.dart';
import 'package:yarab/screens/setting%20screen.dart';
import 'package:yarab/screens/tab_screen.dart';
import 'package:flutter/material.dart';

import 'Signup.dart';
void main() {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("categories"),
      ),
      body: Signup(),
      // bottomNavigationBar: TabsScreen(),
      drawer:  DrawerScreen(),
    );
  }

}
