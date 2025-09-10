import 'package:flutter/material.dart';
import 'package:simple_todo_app/colors.dart';

class TaskInputDialog extends StatelessWidget {
  const TaskInputDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightGreen,
      content: Container(height: 180, width: 100, child: Column(children: [])),
    );
  }
}
