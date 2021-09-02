import 'package:flutter/cupertino.dart';
import 'package:todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskData = [
    Task(title: 'Learn Flutter now.'),
  ];

  void addTask(Task task) {
    _taskData.add(task);
    notifyListeners();
  }

  void delTask(Task task) {
    _taskData.remove(task);
    notifyListeners();
  }

  List<Task> get taskList {
    return List<Task>.unmodifiable(_taskData);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
