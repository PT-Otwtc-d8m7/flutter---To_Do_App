// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key, 
    required this.taskName, 
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
              )          
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.purple[500],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
        
              // Checkbox
              Checkbox(
                value: taskComplete, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              // Taskname
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskComplete 
                  ? TextDecoration.lineThrough 
                  : TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}