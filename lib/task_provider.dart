import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/task_data.dart';

class TaskProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  List<TaskData> tasks = [];

  Future saveTask() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList('tasks', tasksJson);
  }

  void addTask(TaskData task) async {
    tasks.add(task);
    await saveTask();
    notifyListeners();
  }

  Future<void> toggleTaskStatus(int index) async {
    tasks[index].isDone = !tasks[index].isDone;
    await saveTask();
    notifyListeners();
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? tasksJson = prefs.getStringList('tasks');
    if (tasksJson != null) {
      tasks = tasksJson.map((jsonStr) => TaskData.fromJson(jsonStr)).toList();

      notifyListeners();
    }
  }

  void removeTask(int index) async {
    tasks.removeAt(index);
    await saveTask();
    notifyListeners();
  }

  void updateTask(int index, TaskData newTask) async {
    tasks[index] = newTask;
    await saveTask();
    notifyListeners();
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool('isDark', themeMode == ThemeMode.dark);
    notifyListeners();
  }

  Future<void> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? false;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
 }
