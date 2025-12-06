import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_data.dart';
import 'package:todo_app/task_provider.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});
  TextEditingController taskController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;


  @override
  Widget build(BuildContext context) {
  
    
    return Consumer<TaskProvider>(
      builder: (BuildContext context, TaskProvider taskProv, Widget? child)=>
       BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 16),
      
            
                Text(
                  'Achieve a new task',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.dark?Colors.white:Colors.black),
                ),
                SizedBox(height: 16),
      
             
                TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    labelText: 'Enter your task',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
      
            
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Determine start date & end date',
                        style: TextStyle(fontSize: 16,color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black),
                      ),
                    ),
                    IconButton(
  onPressed: () async {
    final DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: startDate != null && endDate != null
          ? DateTimeRange(start: startDate!, end: endDate!)
          : null,
    );

    if (pickedRange != null) {
      startDate = pickedRange.start;
      endDate = pickedRange.end;
    }
  },
  icon: Icon(Icons.calendar_month_outlined),
),
                  ],
                ),
                SizedBox(height: 24),
      
             
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 135, 21, 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
  if (taskController.text.isEmpty || startDate == null || endDate == null) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data')));
   
  }

  taskProv.addTask(
    TaskData(
      title: taskController.text,
      startDate: startDate!,
      endDate: endDate!,
    ),
  );

  taskController.clear();
  Navigator.pop(context);
},

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 13, 106, 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        },
        onClosing: () {},
      ),
    );
  }
}
