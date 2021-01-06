import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Add your task"),
          TextField(
            controller: textController,
          ),
          FlatButton(
              child: Text("add"),
              onPressed: () {
                Navigator.pop(context, textController);
              })
        ],
      ),
    );
  }
}
