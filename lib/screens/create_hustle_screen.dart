import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todosql/utils/extensions.dart';
import 'package:todosql/widgets/widgets.dart';

class CreateHustleScreen extends StatelessWidget {
  static CreateHustleScreen builder(
    BuildContext context,
    GoRouterState state,
  ) => const CreateHustleScreen();
  const CreateHustleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(
          text: 'Create Hustle',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextField(
              fieldLabel: 'Hustle Tile',
              hintText: 'Enter Hustle ',
            ),

            const Gap(16),

            SelectDateTime(),

            const Gap(16),

            CommonTextField(
              fieldLabel: 'Note',
              hintText: 'Enter a description ',
              maxLines: 6,
            ),
            const Gap(16),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  context.colorScheme.tertiary,
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DisplayWhiteText(text: 'Save Hustle'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
