import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todosql/data/data.dart';
import 'package:todosql/providers/hustle/hustle.dart';
import 'package:todosql/utils/utils.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: context.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Hustle hustle,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: const Text('NO'),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(hustleProvider.notifier).deleteHustle(hustle).then((
          value,
        ) {
          displaySnackBar(context, 'Hustle Deleted Successfully');
          context.pop();
        });
      },
      child: const Text('YES', style: TextStyle(color: Colors.black)),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this hustle?'),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
      context: context,
      builder: (ctx) {
        return alert;
      },
    );
  }
}
