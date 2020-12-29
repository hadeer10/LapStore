import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categorylapitem extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final String price;

  Categorylapitem({
      this.id,
      this.image,
      this.title,
      this.price,
      });


  void selectlap(BuildContext ctx){
    Navigator.of(ctx).pushNamed("lapdetailsscreen",
      arguments: id,
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  () {
        selectlap(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(image , width: double.infinity, height: 200, fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    color: Colors.black38,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    child: Text(title ,
                      style: TextStyle(fontSize: 25 , color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
             Padding(
               padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.merge_type),
                        SizedBox(width: 6,),
                        Text('specific'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 3,),
                        Text('$price'),
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
