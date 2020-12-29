import 'package:yarab/dummy.dart';
import 'package:yarab/models/laps.dart';
import 'package:yarab/screens/card_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LapDetails extends StatefulWidget {
  @override
  _LapDetailsState createState() => _LapDetailsState();
}

class _LapDetailsState extends State<LapDetails> {

  void addLapToCard(Laps lap) {
    setState(() {
      cartlap.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lapid = ModalRoute.of(context).settings.arguments as String;
    final selectlap = dummy_laps.firstWhere((element) => element.id == lapid );
    return Scaffold(
      appBar: AppBar(title: Text(selectlap.title)),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectlap.image , fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Details" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey)
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx , index){
                return Card(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
                    child: Text(selectlap.details[index]),
                  ),
                ) ;
              },
              itemCount: selectlap.details.length,

            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addLapToCard(selectlap);
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}