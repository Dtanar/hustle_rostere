import 'package:flutter/material.dart';

import '../data/data.dart';

class TaskDetailsSheet extends StatelessWidget {
  const TaskDetailsSheet({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [Icon(task.category.icon, color: task.category.color)],
        ),
      ),
    );
  }
}
