import 'package:flutter/material.dart';
import 'package:todo_examples7/task.dart';

class FilterButtons extends StatelessWidget {
  final int allListLength;
  final int doneListLength;
  final int deletedListLength;
  final Function setListFilter;

  const FilterButtons({
    Key key,
    this.allListLength,
    this.doneListLength,
    this.deletedListLength,
    this.setListFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "To Do List",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          child: Row(
            children: [
              FlatButton(
                  onPressed: () => setListFilter(TaskFilter.all),
                  child: Text("$allListLength All Task(s)")),
              FlatButton(
                  onPressed: () => setListFilter(TaskFilter.done),
                  child: Text("$doneListLength Done Task(s)")),
              FlatButton(
                  onPressed: () => setListFilter(TaskFilter.deleted),
                  child: Text("$deletedListLength Deleted Task(s)")),
            ],
          ),
        ),
      ],
    );
  }
}
