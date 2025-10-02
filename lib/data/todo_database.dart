import 'package:hive_ce_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<List<dynamic>> _todoList = [];
  late Box<List<dynamic>> todoEntryBox;

  Future<List<List<dynamic>>> load() async {
    todoEntryBox = await Hive.openBox<List<dynamic>>('todo_databox');

    // Load data from the box
    _todoList = todoEntryBox.values.toList();
    return _todoList;
  }

  // Add a new task
  Future<void> addTask(List<dynamic> task) async {
    await todoEntryBox.add(task); // Hive auto-generates keys
    _todoList = todoEntryBox.values.toList(); // keep memory in sync
  }

  // Update a task by key (index in the box)
  Future<void> updateTask(int index, List<dynamic> updatedTask) async {
    await todoEntryBox.putAt(index, updatedTask);
    _todoList = todoEntryBox.values.toList();
  }

  // Delete a task by key (index in the box)
  Future<void> deleteTask(int index) async {
    await todoEntryBox.deleteAt(index);
    _todoList = todoEntryBox.values.toList();
  }
}
