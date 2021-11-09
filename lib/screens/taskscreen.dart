import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(
                  Icons.list,
                  color: Colors.red,
                  size: 35,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Todo',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                '3 Tasks',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Flexible(
              child: Container(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    Item(
                      txt: 'Buy eggs',
                    ),
                    Item(
                      txt: 'Bread',
                    ),
                    Item(
                      txt: 'Milk',
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: MediaQuery.of(context).size.height * 0.75,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  String txt = 'item';
  bool press = false;
  Item({required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                if (press == true) {
                  press = false;
                } else {
                  press = true;
                }
              },
              icon: press
                  ? Icon(Icons.check_box_outline_blank)
                  : Icon(Icons.check_box_outlined),
              color: Colors.black,
            ),
          ],
        ));
  }
}
