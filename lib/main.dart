import 'package:flutter/material.dart';
import 'screens/taskscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.black),
      home: TasksScreen(),
    );
  }
}
