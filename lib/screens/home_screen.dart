import "package:flutter/material.dart";
import "package:simple_todo_app/colors.dart";
import "package:simple_todo_app/components/todo_tile.dart";
import "package:simple_todo_app/components/task_dialog.dart";
import "package:simple_todo_app/data/todo_database.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // open Todo entry database (box)

  ToDoDatabase dbRef = ToDoDatabase();
  List<List<dynamic>> todoList = [];

  final TextEditingController _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() => todoList[index][1] = todoList[index][1]);
  }

  void cancelToDoTask() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  void saveNewToDoTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      cancelToDoTask();
    });
  }

  void createNewToDoTask() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return TaskInputDialog(
          inputController: _controller,
          onSave: saveNewToDoTask,
          onCancel: cancelToDoTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      this.todoList.removeAt(index);
    });
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
        onPressed: createNewToDoTask,
        backgroundColor: lightGreen,
        child: Icon(Icons.add, color: whiteBackground),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTaskFunction: (context) => this.deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
