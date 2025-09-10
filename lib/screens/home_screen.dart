import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../providers/providers.dart';
import '../config/config.dart';
import '../data/data.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final hustleState = ref.watch(hustleProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.tertiary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(text: 'Hustle Roster', fontSize: 20),
                    Gap(20),
                    DisplayWhiteText(text: 'Hustle Roster', fontSize: 40),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: deviceSize.height * 0.2,
            right: 0,
            left: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfHustle(tasks: hustleState.hustles),

                    const Gap(20),

                    Text(
                      'Completed Tasks',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: colors.onSurfaceVariant,
                      ),
                    ),

                    const Gap(10),

                    DisplayListOfHustle(
                      isCompletedTask: true,
                      tasks: [
                        Hustle(
                          title: 'title',
                          note: '',
                          time: 'time',
                          isCompleted: true,
                          dueDate: '2025-09-05',
                          category: HustleCategories.work,
                        ),
                      ],
                    ),

                    const Gap(20),

                    ElevatedButton(
                      onPressed: () =>
                          context.push(RoutesLocation.createHustle),

                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          colors.tertiary,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: 'Add New Hustle'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
