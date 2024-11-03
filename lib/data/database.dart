import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/util/todo_tile.dart';

class ToDoDatabase {

  List toDoList = [];

  // Reference our box
  final _myBox = Hive.box('myBox');

  // Run this method if this it the first tiem ever opening this app
  void createInitialData() {
      toDoList = [
        ["Demo Task", false],
      ];
  }

  // Load the data from the database
  void loadData() {
    toDoList =_myBox.get("TODOLIST");
  }

  // Update the database
  void updateDataBase() {
      _myBox.put("TODOLIST", toDoList);
  }
}