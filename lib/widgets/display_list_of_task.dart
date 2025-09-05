import 'package:flutter/material.dart';

import '../data/models/models.dart';
import '../utils/utils.dart';
import 'widgets.dart';


class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask({
    super.key,
    this.tasks,
    this.isCompletedTask = false,
  });

  final List<Task>? tasks;

  final bool isCompletedTask;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTask
        ? deviceSize.height * 0.25
        : deviceSize.height * 0.3;
    final emptyTaskMessage = isCompletedTask
        ? 'No completed tasks yet!'
        : 'No hustle to attack!';

    return CommonContainer(
      height: height,
      child: tasks!.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks?.length ?? 0,
              itemBuilder: (context, index) {
                final task = tasks![index];
                return TaskTile(task: task);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 2);
              },
            ),
    );
  }
}
