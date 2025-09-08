import 'package:flutter/material.dart';

import '../data/data.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class DisplayListOfHustle extends StatelessWidget {
  const DisplayListOfHustle({
    super.key,
    this.tasks,
    this.isCompletedTask = false,
  });

  final List<Hustle>? tasks;

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
                return InkWell(
                  onLongPress: () {
                    //TODO: DELETE TASK
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                      constraints: BoxConstraints(minWidth: deviceSize.width),

                      context: context,
                      builder: (context) {
                        return HustleDetailsSheet(hustle: task);
                      },
                    );
                  },

                  child: HustleTile(hustle: task),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 2);
              },
            ),
    );
  }
}
