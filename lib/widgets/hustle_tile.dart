import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';
import '../data/data.dart';
import '../utils/utils.dart';

class HustleTile extends StatelessWidget {
  const HustleTile({super.key, required this.hustle, this.onCompleted});
  final Hustle hustle;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final style = context.textTheme;
    final double iconOpacity = hustle.isCompleted ? 0.3 : 1.0;
    final double backgroundOpacity = hustle.isCompleted ? 0.1 : 0.3;
    final textDecoration = hustle.isCompleted
        ? TextDecoration.lineThrough
        : TextDecoration.none;
    final fontWeight = hustle.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 8),
      child: Row(
        children: [
          CircleContainer(
            color: hustle.category.color.withValues(alpha: backgroundOpacity),

            borderColor: hustle.category.color.withValues(alpha: iconOpacity),
            child: Center(
              child: Icon(
                hustle.category.icon,
                color: hustle.category.color.withValues(alpha: iconOpacity),
              ),
            ),
          ),
          const Gap(20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hustle.title,
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
                  hustle.time,
                  style: style.bodySmall?.copyWith(
                    decoration: textDecoration,
                    color: colors.onSurface.withValues(alpha: .7),
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: hustle.isCompleted, onChanged: onCompleted),
        ],
      ),
    );
  }
}
