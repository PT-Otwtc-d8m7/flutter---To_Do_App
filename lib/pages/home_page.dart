import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State <HomePage> createState() =>  HomePageState();
}

class  HomePageState extends State<HomePage> {
  // Reference hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = new ToDoDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // There already data
      db.loadData();
    }
    super.initState();
  }

  // Text controller
  final _controller = TextEditingController();

  // Method onChanged
  void onChanged(bool? value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Method saveNewTask
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create a new task
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
      });
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text("To Do App"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0], 
              taskComplete: db.toDoList[index][1], 
              onChanged: (value) => onChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              );
          },
      ),
    );
  }
}