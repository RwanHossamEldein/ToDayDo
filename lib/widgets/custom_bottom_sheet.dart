import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_provider.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});
  TextEditingController taskController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  @override
  Widget build(BuildContext context) {
    var TaskProv = Provider.of<TaskProvider>(context);
    var tasks = TaskProv.tasks;
    return BottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الشريط الصغير اللي فوق للتمييز
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 16),

              // العنوان
              Text(
                'Achieve a new task',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // حقل النص
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

              // صف التاريخ
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Determine start date & end date',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // يبقى logic زي ما هو
                    },
                    icon: Icon(Icons.calendar_month_outlined),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // أزرار Cancel و Save
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, // logic موجودة
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
                      onPressed: () {}, // logic موجودة
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
    );
  }
}
