import 'package:flutter/material.dart';
import 'package:todo_examples7/task.dart';

class TaskListTile extends StatefulWidget {
  final Task item;
  final Function setEditMode;
  final Function onSave;
  final Function changeCheckbox;
  final Function onDelete;

  TaskListTile(
      {this.item,
      this.onSave,
      this.setEditMode,
      this.changeCheckbox,
      this.onDelete});

  @override
  _TaskListTileState createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myController.text = widget.item.taskName;
    return ListTile(
      leading: widget.item.isEditMode
          ? IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.onSave(myController.text))
          : IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => widget.setEditMode(true)),
      title: widget.item.isEditMode
          ? TextField(controller: myController)
          : Text(widget.item.taskName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Checkbox(
                value: widget.item.isDone, onChanged: widget.changeCheckbox),
            IconButton(icon: Icon(Icons.delete), onPressed: widget.onDelete)
          ],
        ),
      ),
    );
  }
}
