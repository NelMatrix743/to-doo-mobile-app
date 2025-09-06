import 'package:flutter/material.dart';
import "package:simple_todo_app/screens/home_screen.dart";
//import "package:flutter/rendering.dart";

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const ToDoo());
}

class ToDoo extends StatelessWidget {
  const ToDoo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
