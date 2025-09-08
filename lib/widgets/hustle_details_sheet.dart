import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';
import '../data/data.dart';

class HustleDetailsSheet extends StatelessWidget {
  const HustleDetailsSheet({super.key, required this.hustle});
  final Hustle hustle;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleContainer(
              color: hustle.category.color.withValues(alpha: 0.3),
              borderColor: hustle.category.color.withValues(alpha: 0.6),
              child: Icon(hustle.category.icon, color: hustle.category.color),
            ),
            const Gap(16),
            Text(
              hustle.title,
              style: style.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(hustle.time, style: style.titleMedium),
            const Gap(16),
            Visibility(
              visible: !hustle.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Due Date: ${hustle.dueDate}', style: style.bodySmall),
                  const Gap(5),
                  Icon(Icons.check_box, color: Colors.grey),
                ],
              ),
            ),

            const Gap(16),
            Divider(thickness: 1.5, color: hustle.category.color),
            const Gap(16),
            Text(
              hustle.note.isEmpty
                  ? 'No additional notes included'
                  : hustle.note,
              textAlign: TextAlign.center,
            ),

            const Gap(20),
            Visibility(
              visible: hustle.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hustle Completed', style: style.bodySmall),
                  const Gap(5),
                  Icon(Icons.check_box, color: hustle.category.color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
