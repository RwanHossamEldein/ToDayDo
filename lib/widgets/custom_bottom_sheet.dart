import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_data.dart';
import 'package:todo_app/task_provider.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatefulWidget {

 final int? editIndex;           
  final TaskData? task;        

  const CustomBottomSheet({super.key, this.editIndex, this.task});
  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController taskController = TextEditingController();

  DateTime? startDate;

  DateTime? endDate;
@override
void initState() {
  super.initState();
  if (widget.task!=null) {
    taskController.text=widget.task!.title;
    startDate = widget.task!.startDate;
      endDate = widget.task!.endDate;
    
  }
}
  @override
  Widget build(BuildContext context) {
  
    
    return Consumer<TaskProvider>(
  builder: (BuildContext context, TaskProvider taskProv, Widget? child) {
    return CupertinoActionSheet(
      title: Column(
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
            widget.editIndex != null
                ? 'Edit your task'
                : 'Achieve a new task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),

      message: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_month_outlined),
                  onPressed: () async {
                    final DateTimeRange? pickedRange =
                        await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      initialDateRange: startDate != null && endDate != null
                          ? DateTimeRange(start: startDate!, end: endDate!)
                          : null,
                  builder: (context, child) {
                    return Theme(data:Theme.of(context).copyWith(colorScheme: ColorScheme.light(
                      primary: Colors.deepPurple,   // لون الدائرة المختارة
          onPrimary: Colors.white,      // لون النص جوه الدائرة
          surface: Colors.white,        // خلفية البوب أب
          onSurface: Colors.black,      // لون النص الأساسي
                    ), dialogTheme: DialogThemeData(backgroundColor: const Color.fromARGB(255, 0, 0, 0))), child: child!);
                  },  );

                    if (pickedRange != null) {
                      setState(() {
                        startDate = pickedRange.start;
                        endDate = pickedRange.end;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),

      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            if (taskController.text.isEmpty ||
                startDate == null ||
                endDate == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please complete all fields')),
              );
              return;
            }

            if (widget.editIndex != null) {
              taskProv.updateTask(
                widget.editIndex!,
                TaskData(
                  title: taskController.text,
                  startDate: startDate!,
                  endDate: endDate!,
                  isDone: widget.task!.isDone,
                  isSaved: widget.task!.isSaved,
                ),
              );
            } else {
              taskProv.addTask(
                TaskData(
                  title: taskController.text,
                  startDate: startDate!,
                  endDate: endDate!,
                ),
              );
            }

            taskController.clear();
            Navigator.pop(context);
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],

      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Cancel',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  },
);
  }}