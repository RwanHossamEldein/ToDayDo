import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'package:todo_app/task_provider.dart';


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
            useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(255, 27, 106, 191),  
    onPrimary: Colors.white,
    surface: Colors.white,
   
    onSurface: Colors.black,
  ),
            appBarTheme: const AppBarTheme(
              backgroundColor:Color.fromARGB(255, 27, 106, 191),
              foregroundColor: Colors.white,
            ),
            cardColor:Color.fromARGB(255, 27, 106, 191),
          ),
         darkTheme: ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF90CAF9), 
    onPrimary: Colors.black,
    surface: Color.fromARGB(255, 66, 65, 65),
    onSurface: Colors.white,
  ),
  cardColor:  Color.fromARGB(255, 34, 34, 34),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 34, 34, 34),
    foregroundColor: Colors.white,
  ),
),

         
          home:TodoScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
