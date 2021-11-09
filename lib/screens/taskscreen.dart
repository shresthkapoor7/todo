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
              padding: EdgeInsets.only(top: 40.0, left: 40),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(
                  Icons.list,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
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
              padding: EdgeInsets.only(left: 45.0),
              child: Text(
                '10 Tasks',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Flexible(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20),
                    child: Column(
                      children: [
                        Text(
                          'Add todo items here',
                          style: TextStyle(fontSize: 80, color: Colors.green),
                        )
                      ],
                    ),
                  ),
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
