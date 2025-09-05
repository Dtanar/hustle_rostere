import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todosql/widgets/circle_container.dart';
import '../data/data.dart';
import '../utils/extensions.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 1.0;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration = task.isCompleted
        ? TextDecoration.lineThrough
        : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 8),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withValues(alpha: backgroundOpacity),

            borderColor: task.category.color.withValues(alpha: iconOpacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withValues(alpha: iconOpacity),
              ),
            ),
          ),
          const Gap(20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                const Gap(5),
                // Text(
                //   task.note,
                //   style: style.bodyMedium?.copyWith(
                //     decoration: textDecoration,
                //     fontSize: 16,
                //   ),
                // ),
                const Gap(5),
                Text(
                  task.time,
                  style: style.bodySmall?.copyWith(
                    decoration: textDecoration,
                    color: colors.onSurface.withValues(alpha: .7),
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onCompleted),
        ],
      ),
    );
  }
}
