import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/task_data.dart';

class TaskProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool saveTask=true;
  List<TaskData> tasks = [];
  void addTask(TaskData task)async {
    // final prefs=await SharedPreferences.getInstance();
    // await prefs.setBool('task',saveTask);


    tasks.add(task);
    notifyListeners();
  }
  // Future saveTask()async{
  //   final prefs=await SharedPreferences.getInstance();


  // }

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

  void toggleTheme()async {
   final prefs=await SharedPreferences.getInstance();

    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool('isDark',themeMode==ThemeMode.dark);
    notifyListeners();
  }
Future getTheme()async{
    final prefs=await SharedPreferences.getInstance();
    bool ? isDark= prefs.getBool('isDark')??false;
     themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  notifyListeners();

  }
}
