import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_bottom_sheet.dart';
import 'package:todo_app/widgets/custom_task.dart' show CustomTask;
import 'package:todo_app/task_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var TaskProv = Provider.of<TaskProvider>(context);
    var tasks = TaskProv.tasks;

    double totalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  'You have ${tasks.length} tasks today',
                  style: TextStyle(
                    color: TaskProv.themeMode == ThemeMode.light
                        ? const Color.fromARGB(255, 2, 1, 1)
                        : const Color.fromARGB(255, 255, 252, 252),
                  ),
                ),
                Spacer(),
                Text(
                  'add a new task',
                  style: TextStyle(
                    color: TaskProv.themeMode == ThemeMode.light
                        ? const Color.fromARGB(255, 2, 1, 1)
                        : const Color.fromARGB(255, 255, 252, 252),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => CustomBottomSheet(),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.only(
                right: 15,
                left: 15,
                top: 20,
                bottom: totalHeight * 0.1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              color: Theme.of(context).cardColor,
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No tasks added yet!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return CustomTask(index: index);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
