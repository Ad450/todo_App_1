import 'package:flutter/material.dart';

import 'package:todoapp1/task.dart';
import 'package:todoapp1/taskList.dart';

class AppUI extends StatefulWidget {
  @override
  _AppUIState createState() => _AppUIState();
}

class _AppUIState extends State<AppUI> {
  //bool isDone = false;
  String message;
  List<Task> taskList = [
    //  Task(message: 'this is a task'),
    //Task(message: 'this is a second task'),
    //Task(message: 'this is a third task'),
  ];
  // void toggleDone(isDone){
  //   setState(() {
  //    isDone = !isDone;
  //  });
  //  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.bookmark,
                          color: Colors.pink, size: 30),
                      maxRadius: 30.0,
                    ),
                    Text(
                      'Todo App',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                          taskList.length != 0
                              ? 'You have ${taskList.length} task to do'
                              : 'You have no task .',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                )),
          ),
          Container(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) => TaskTile(
                message: taskList[index].message,
                taskFromTask: taskList,
              ),
            ),
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                color: Colors.white,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                    )),
                    Flexible(
                      child: FlatButton(
                          color: Colors.pink,
                          onPressed: () {
                            // add new task
                            //  print(message);
                            setState(() {
                              taskList.add(Task(message: message));
                            });
                            _controller.clear();
                          },
                          child: Text('Add Task', style: TextStyle(color: Colors.white),),
                    ))
                  ],
                )),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink,
        tooltip: 'please add task',
      ),
    );
  }
}
