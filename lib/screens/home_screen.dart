import "package:flutter/material.dart";
import "package:simple_todo_app/colors.dart";
import "package:simple_todo_app/components/todo_tile.dart";
import "package:simple_todo_app/components/task_dialog.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<dynamic>> todoList = [
    ["Hello, World!", true],
    ["Complete to-doo", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() => todoList[index][1] = !todoList[index][1]);
  }

  void createNewToDoTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskInputDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBackground,
      appBar: AppBar(
        backgroundColor: lightGreen,
        title: Text(
          "TO-DOO",
          style: TextStyle(
            color: whiteBackground,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: this.createNewToDoTask,
        child: Icon(Icons.add, color: whiteBackground),
        backgroundColor: lightGreen,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => this.checkBoxChanged(value, index),
            );
          },
        ),
      ),
    );
  }
}
