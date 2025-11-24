import 'package:flutter/material.dart';
import 'package:todo_app/task_data.dart';

class TaskProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  List<TaskData> tasks = [];
  void addTask(TaskData task) {
    tasks.add(task);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index, TaskData newTask) {
    tasks[index] = newTask;
    notifyListeners();
  }

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
