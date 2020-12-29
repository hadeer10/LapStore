import 'package:yarab/dummy.dart';
import 'package:yarab/widgets/categorylapsitem.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Categorieslapscreen extends StatefulWidget {
  @override
  _CategorieslapscreenState createState() => _CategorieslapscreenState();
}

class _CategorieslapscreenState extends State<Categorieslapscreen> {
  @override
  Widget build(BuildContext context) {
    final routeargs=ModalRoute.of(context).settings.arguments as Map<String , String>;
    final routeargsid = routeargs['id'];
    final routeargstitle = routeargs['title'];
    final categorylaps = dummy_laps.where((lap) {
      return lap.categories.contains(routeargsid);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(routeargstitle),),
      body: ListView.builder(
          itemBuilder: (ctx , index){
            return Categorylapitem(
              id: categorylaps[index].id,
              image: categorylaps[index].image,
              title: categorylaps[index].title,
              price: categorylaps[index].price,
            );
          },
          itemCount: categorylaps.length,

      ),
    );
  }
}
