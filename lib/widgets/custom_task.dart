import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_provider.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var taskProv = Provider.of<TaskProvider>(context);
    var tasks = taskProv.tasks;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tasks[index].title),
              Text('start date:${tasks[index].startDate}'),
              Text('end date:${tasks[index].endDate}'),
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
            value: tasks[index].isDone,
            onChanged: (value) {
              taskProv.toggleTaskStatus(index);
            },
          ),
        ],
      ),
    );
  }
}
