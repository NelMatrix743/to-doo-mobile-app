import 'package:flutter/material.dart';
import 'package:simple_todo_app/colors.dart';
import "package:simple_todo_app/components/dialog_buttons.dart";

class TaskInputDialog extends StatelessWidget {
  final TextEditingController inputController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const TaskInputDialog({
    super.key,
    required this.inputController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightGreen,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.zero, // Or BorderRadius.all(Radius.circular(0.0))
      ),
      content: Container(
        height: 180,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: this.inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "add a task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(buttonText: "SAVE", onPressed: this.onSave),
                SizedBox(width: 10),
                DialogButton(buttonText: "CANCEL", onPressed: this.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
