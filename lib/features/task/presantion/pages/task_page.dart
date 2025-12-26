import 'package:flutter/material.dart';
import '../providers/task_provider.dart';
import 'package:provider/provider.dart';
class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  void initState() {
    super.initState();
    // Fetch tasks when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskProvider>(context, listen: false).getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Today's Tasks")),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          // Loading state
          if (taskProvider.isloading) {
            return Center(child: CircularProgressIndicator());
          }
          
          // // Error state
          if (taskProvider.error != null) {
            return Center(child: Text("Error: ${taskProvider.error}"));
          }
          
          // Empty state
          if (taskProvider.tasks.isEmpty) {
            return Center(child: Text("No tasks for today"));
          }
          
          // Display tasks
          return SingleChildScrollView(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return ListTile(
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  title: Text(task.title),
                  subtitle: Text("Reward: ${task.rewardAmount} ETB"),
                  // trailing: Text(task.taskDate.toString()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
