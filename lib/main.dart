import 'package:flutter/material.dart';
import "package:simple_todo_app/screens/home_screen.dart";
import 'package:hive_ce_flutter/hive_flutter.dart';
//import "package:flutter/rendering.dart";

void main() async {
  //debugPaintSizeEnabled = true;

  // initialize the hive framework
  await Hive.initFlutter();

  // open Todo entry database (box)
  var todoEntryBox = Hive.openBox("todo_database");

  runApp(const ToDooApp());
}

class ToDooApp extends StatelessWidget {
  const ToDooApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
