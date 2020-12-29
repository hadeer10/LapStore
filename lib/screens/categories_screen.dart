import 'package:yarab/dummy.dart';
import 'package:yarab/screens/drawer_screen.dart';
import 'package:yarab/widgets/categoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:yarab/dummy.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("categories"),
      ),
      body:  GridView(
        padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing:20,
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
          ),
        children:dummy_category.map((e) =>
            CategoriesItems(e.id, e.title, e.color),
        ).toList(),
      ),
      drawer:  DrawerScreen(),
    );
  }
}
