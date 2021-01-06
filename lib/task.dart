enum TaskFilter { all, done, deleted }

class Task {
  String taskName;
  bool isDone;
  bool isEditMode;
  bool isDeleted;
  TaskFilter taskFilter;

  Task(
      {this.taskName,
      this.isDone,
      this.isEditMode,
      this.isDeleted,
      this.taskFilter});
}

List<Task> taskList = [
  Task(taskName: "a", isDone: false, isEditMode: false, isDeleted: false),
  Task(taskName: "bbbb", isDone: false, isEditMode: false, isDeleted: false),
  Task(taskName: "cccc", isDone: false, isEditMode: false, isDeleted: false),
  Task(taskName: "ddddd", isDone: false, isEditMode: false, isDeleted: false),
  Task(taskName: "eeeee", isDone: false, isEditMode: false, isDeleted: false),
  Task(taskName: "ffffff", isDone: false, isEditMode: false, isDeleted: false),
];
