import 'package:yarab/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:yarab/dummy.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _x = 1;
  String id;
  void incresment() {
    setState(() {
      _x++;
    });
  }

  void decresment() {
    setState(() {
      _x--;
    });
  }

  String totalprice() {
    int sum = 0;
    cartlap.forEach((element) {
      int p = int.parse(element.price);
      sum = sum + (p*_x);
    });
    final x = AlertDialog(
      title: Text("total price"),
      content: Container(
        height: 90,
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Text(sum.toString()),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "close",
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, child: x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: totalprice,
              child:
                  Text('total price', style: TextStyle(color: Colors.white))),
        ],
        title: Text("Cart"),
        backgroundColor: Colors.blue,
      ),
      drawer: DrawerScreen(),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemBuilder: (ctx, index) => Dismissible(
                  key: Key(cartlap[index].image),
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      cartlap.removeAt(index);
                    });
                  },
                  direction: DismissDirection.endToStart,
                  child: Container(
                      height: 80,
                      child: Card(
                        child: Row(
                          children: [
                            Image.network(cartlap[index].image,
                                fit: BoxFit.cover),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    cartlap[index].title,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    (int.parse(cartlap[index].price) * _x)
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.minimize),
                          onPressed: (){
                              decresment();
                              },
                            ),
                            Text('$_x'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: (){
                                incresment();
                              },
                            ),
                          ],
                        ),
                      )),
                ),
            itemCount: cartlap.length),
      ),
    );
  }
}
