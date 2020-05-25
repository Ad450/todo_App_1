import 'package:flutter/material.dart';
import 'package:todoapp1/taskList.dart';

// Each Tasktile of the ListView contains a Task().message as its title
// this updated through the Tasktile constructor in the AppUI class
class TaskTile extends StatefulWidget {

  final List<Task> taskFromTask;
  final String message;
  TaskTile({this.message, this.taskFromTask});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
        child: ListTile(
            title: Text(widget.message,
                style: TextStyle(
                    decoration: isChecked ? TextDecoration.lineThrough : null)),
            trailing: Checkbox(
              activeColor: Colors.pink,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                })));
  }
}
