import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../data/data.dart';
import '../utils/extensions.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: task.category.color.withValues(alpha: 0.2),
              border: Border.all(color: task.category.color, width: 2),
            ),
            child: Center(
              child: Icon(task.category.icon, color: task.category.color),
            ),
          ),
          const Gap(20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(5),
                Text(task.note, style: context.textTheme.bodyMedium),
                const Gap(5),
                Text(task.time, style: context.textTheme.bodySmall),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: (value) {}),
        ],
      ),
    );
  }
}
