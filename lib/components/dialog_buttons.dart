import 'package:flutter/material.dart';
import 'package:simple_todo_app/colors.dart';

class DialogButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const DialogButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onPressed,
      color: deepGreen,
      child: Text(this.buttonText, style: TextStyle(color: whiteBackground)),
    );
  }
}
