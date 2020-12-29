
import 'dart:ffi';

import 'package:yarab/screens/card_screen.dart';
import 'package:yarab/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List pages=[
    {
      "page":CategoriesScreen,
       "title":'categories',
    },
    {
    "page":CardScreen,
    "title":'Card',
    },
  ];
  int selectindex=0;
   selectpage(int value) {
    setState(() {
      selectindex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selectindex]["title"]),),
      body: pages[selectindex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: selectindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category)
            ),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard))
        ],
      ),
    );
  }

}
