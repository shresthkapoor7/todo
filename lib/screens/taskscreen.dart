import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(
      fontSize: 15.0, color: Colors.grey, fontStyle: FontStyle.italic),
  hintText: 'Enter a task to be added',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  ),
);
bool af = false;

class TasksScreen extends StatelessWidget {
  final myController = TextEditingController();

  Widget buildBottomSheet(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Add Task',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'At',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 10, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration,
                controller: myController,
              ),
            ),
            TextButton(
                onPressed: () {
                  //TODO:
                  if (myController.text != '')
                    items.add(Item(txt: myController.text));
                  myController.text = '';
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))))
          ],
        ));
  }

  List<Item> items = [
    // Item(txt: 'Buy Egg'),
    // Item(txt: 'Buy Bread'),
    // Item(txt: 'Buy Choclate'),
    // Item(txt: 'Buy milk')
  ];
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
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: buildBottomSheet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
          // builder: (context) => SingleChildScrollView(
          //         child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius:
          //               BorderRadius.only(topLeft: Radius.circular(20))),
          //       padding: EdgeInsets.only(
          //           bottom: MediaQuery.of(context).viewInsets.bottom),
          //       child: buildBottomSheet(context),
          //     )));
        },
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20),
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
                items.length.toString(),
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Container(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: items,
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

class Item extends StatefulWidget {
  String txt = 'item';

  Item({required this.txt});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool press = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.txt,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  decoration:
                      press ? TextDecoration.none : TextDecoration.lineThrough),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (press == true) {
                    press = false;
                  } else {
                    press = true;
                  }
                });
              },
              icon: press
                  ? Icon(Icons.check_box_outline_blank)
                  : Icon(
                      Icons.check_box_outlined,
                      color: Colors.red,
                    ),
              color: Colors.black,
            ),
          ],
        ));
  }
}
