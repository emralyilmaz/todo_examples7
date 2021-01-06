import 'package:flutter/material.dart';
import 'package:todo_examples7/screen/add_task_screen.dart';
import 'package:todo_examples7/task.dart';
import 'package:todo_examples7/widget/filter_buttons.dart';
import 'package:todo_examples7/widget/task_list_tile.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TaskFilter _selectedTaskFilter = TaskFilter.all;
  List<Task> _filteredList = [...taskList];
  List<Task> _rawList = [...taskList];

  _filterData(TaskFilter filter) {
    setState(() {
      _selectedTaskFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    var allList = _rawList.where((e) => e.isDeleted == false).toList();
    var doneList = _rawList
        .where((e) => e.isDone == true && e.isDeleted == false)
        .toList();
    var deletedList = _rawList.where((e) => e.isDeleted == true).toList();

    switch (_selectedTaskFilter) {
      case TaskFilter.all:
        _filteredList = allList;
        break;
      case TaskFilter.done:
        _filteredList = doneList;
        break;
      case TaskFilter.deleted:
        _filteredList = deletedList;
        break;
      default:
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String newTaskName = await showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              });
          setState(() {
            _rawList.add(Task(
                taskName: newTaskName,
                isDeleted: false,
                isDone: false,
                isEditMode: false,
                taskFilter: TaskFilter.all));
          });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
        children: [
          FilterButtons(
            allListLength: allList.length,
            doneListLength: doneList.length,
            deletedListLength: deletedList.length,
            setListFilter: (TaskFilter filter) => _filterData(filter),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 100),
              height: double.minPositive,
              width: 550,
              child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    return TaskListTile(
                      item: _filteredList[index],
                      setEditMode: (bool val) {
                        setState(() {
                          _filteredList[index].isEditMode = val;
                        });
                      },
                      onSave: (String val) {
                        setState(() {
                          _filteredList[index].taskName = val;
                          _filteredList[index].isEditMode = false;
                        });
                      },
                      changeCheckbox: (bool val) {
                        setState(() {
                          _filteredList[index].isDone = val;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          _filteredList[index].isDeleted = true;
                        });

                        print(_filteredList[index].taskName);
                      },
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }
}
