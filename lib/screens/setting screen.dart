
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarab/models/laps.dart';
import 'package:yarab/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:yarab/dummy.dart';
import 'package:yarab/screens/login.dart';
import 'drawer_screen.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Laptop",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading:Icon(Icons.laptop),
                title: Text(
                  "Category",style: TextStyle(
                  fontSize: 20,
                ),
                ),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('CategoriesScreen');
                },
              ),
              ListTile(
                leading:Icon(Icons.card_giftcard),
                title: Text(
                  "Cart",style: TextStyle(
                  fontSize: 20,
                ),
                ),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('cardscreen');
                },
              ),
              ListTile(
                leading:Icon(Icons.settings),
                title: Text(
                  "Settings",style: TextStyle(
                  fontSize: 20,
                ),
                ),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('setting');
                },
              ),
              ListTile(
                leading:Icon(Icons.logout),
                title: Text(
                  "Logout",style: TextStyle(
                  fontSize: 20,
                ),
                ),
                onTap: (){
                  setState(() {
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    Future<void> _signOut() async {
                      await _auth.signOut();
                    }
                  });
                  Navigator.of(context).pushNamed('Login');

                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text("Setting"),
        ),
      ),
    );


  }
}


