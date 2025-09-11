import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosql/providers/hustle/hustle_provider.dart';

import '../data/data.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class DisplayListOfHustle extends ConsumerWidget {
  const DisplayListOfHustle({
    super.key,
    this.hustles,
    this.isCompletedhustle = false,
  });

  final List<Hustle>? hustles;

  final bool isCompletedhustle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = isCompletedhustle
        ? deviceSize.height * 0.25
        : deviceSize.height * 0.3;
    final emptyhustleMessage = isCompletedhustle
        ? 'No completed hustles yet!'
        : 'No hustle to attack!';

    return CommonContainer(
      height: height,
      child: hustles!.isEmpty
          ? Center(
              child: Text(
                emptyhustleMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: hustles?.length ?? 0,
              itemBuilder: (context, index) {
                final hustle = hustles![index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(context, ref, hustle);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                      constraints: BoxConstraints(minWidth: deviceSize.width),

                      context: context,
                      builder: (context) {
                        return HustleDetailsSheet(hustle: hustle);
                      },
                    );
                  },

                  child: HustleTile(
                    hustle: hustle,
                    onCompleted: (value) async {
                      await ref
                          .read(hustleProvider.notifier)
                          .updateHustle(hustle)
                          .then((value) {
                            AppAlerts.displaySnackBar(
                              context,
                              hustle.isCompleted
                                  ? 'Hustle Incomplete'
                                  : 'Hustle Completed',
                            );
                          });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 2);
              },
            ),
    );
  }
}
