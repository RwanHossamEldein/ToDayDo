import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_provider.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProv, child) {
        var task = taskProv.tasks[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title),
                  Text('Start: ${task.startDate.toLocal().toString().split(' ')[0]}'),
                  Text('End: ${task.endDate.toLocal().toString().split(' ')[0]}'),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  taskProv.toggleTaskStatus(index);
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  taskProv.removeTask(index);
                },
                icon: const Icon(Icons.delete),
              ),
              Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  taskProv.toggleTaskStatus(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
