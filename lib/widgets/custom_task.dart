import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/task_provider.dart';
import 'package:todo_app/widgets/custom_bottom_sheet.dart';

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
                  Text(task.title,style: TextStyle(color:Colors.white),),
                  Text('Start: ${task.startDate?.toLocal().toString().split(' ')[0]}',style: TextStyle(color: Colors.white),),
                  Text('End: ${task.endDate?.toLocal().toString().split(' ')[0]}',style: TextStyle(color: Colors.white),),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => CustomBottomSheet(editIndex: index,task: taskProv.tasks[index],),
                      );
                },
                icon: Icon(Icons.edit,color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  taskProv.removeTask(index);
                },
                icon:  Icon(Icons.delete,color: Colors.white),
              ),
              Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  taskProv.toggleTaskStatus(index);
                },
              hoverColor:  Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.white,
              checkColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2)   ),
            ],
          ),
        );
      },
    );
  }
}
