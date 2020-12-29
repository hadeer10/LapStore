import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoriesItems(
    this.id,
    this.title,
    this.color,
  );

  void selectcategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('Categorieslapscreen',
    arguments:{
      'id' : id,
      'title' : title,
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectcategory(context);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
