import 'package:flutter/material.dart';
class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  // Text editing controller to get accees to what we typed
  TextEditingController myController = TextEditingController();

  // Greeting message variable
  String greetingMessage = "";

  // Greet User Method
  void greetUser() {
      setState(() {
        greetingMessage = "Hello " + myController.text;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(75.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Greeting message
              Text(greetingMessage),
              // Textfield
              TextField(              
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type your name",
                ),
              ),
          
              // Button
              ElevatedButton(onPressed: greetUser, child: Text("Tap"),),
            ],
          ),
        ),
      ),
    );
  }
}