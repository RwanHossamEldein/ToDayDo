import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_provider.dart';
import 'package:todo_app/todo_screen.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  final taskProvider=TaskProvider();
 await taskProvider.getTheme();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) =>taskProvider,
       
      child: const MyApp(
      
        ),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
         themeMode: Provider.of<TaskProvider>(context).themeMode,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 18, 80, 142),
              foregroundColor: Colors.white,
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Color.fromARGB(255, 18, 80, 142),
            ),
            cardColor: Color.fromARGB(255, 18, 80, 142),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 34, 34, 34),
              foregroundColor: Colors.white,
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Color.fromARGB(255, 34, 34, 34),
            ),
            cardColor: Color.fromARGB(255, 34, 34, 34),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
          ),
          home: TodoScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
