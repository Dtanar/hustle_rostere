import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';

import '../data/data.dart';

class TaskDetailsSheet extends StatelessWidget {
  const TaskDetailsSheet({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleContainer(
              color: task.category.color.withValues(alpha: 0.3),
              borderColor: task.category.color.withValues(alpha: 0.6),
              child: Icon(task.category.icon, color: task.category.color),
            ),
            const Gap(16),
            Text(
              task.title,
              style: style.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(task.time, style: style.titleMedium),
            const Gap(16),
            Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Due Date: ${task.dueDate}', style: style.bodySmall),
                  const Gap(5),
                  Icon(Icons.check_box, color: Colors.grey),
                ],
              ),
            ),

            const Gap(16),
            Divider(thickness: 1.5, color: task.category.color),
            const Gap(16),
            Text(
              task.note.isEmpty ? 'No additional notes included' : task.note,
              textAlign: TextAlign.center,
            ),

            const Gap(20),
            Visibility(
              visible: task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hustle Completed', style: style.bodySmall),
                  const Gap(5),
                  Icon(Icons.check_box, color: task.category.color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
