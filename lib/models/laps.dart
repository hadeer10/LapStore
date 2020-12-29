import 'package:flutter/cupertino.dart';

class Laps {
  final String id;
  final String title;
  final String price;
  final List <String> details ;
  final List <String> categories;
  final String image;

  const Laps(
      @required this.id,
      @required this.title,
      @required this.price,
     @required this.details,
     @required this.categories,
      @required this.image,

      );
}
