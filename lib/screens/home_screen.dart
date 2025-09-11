import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todosql/data/data.dart';
import '../providers/providers.dart';
import '../config/config.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

// HomeScreen widget that displays the main todo list interface
class HomeScreen extends ConsumerWidget {
  // Static builder method for GoRouter navigation
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get theme colors and device dimensions
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    // Watch for changes in the hustle state and selected date
    final hustleState = ref.watch(hustleProvider);
    final completedHustles = _completedhustles(hustleState.hustles, ref);
    final inCompletedHustles = _inCompletedhustles(hustleState.hustles, ref);
    final selectDate = ref.watch(dateProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Header container with date and title
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.tertiary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Date selector
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: DateFormat.yMMMd().format(selectDate),
                        fontSize: 20,
                      ),
                    ),
                    Gap(20),
                    DisplayWhiteText(text: 'Hustle Roster', fontSize: 40),
                  ],
                ),
              ),
            ],
          ),
          // Main content area with scrollable list of hustles
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
                    // Display incomplete hustles
                    DisplayListOfHustle(hustles: inCompletedHustles),

                    const Gap(20),

                    // Completed hustles section header
                    Text(
                      'Completed hustles',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: colors.onSurfaceVariant,
                      ),
                    ),

                    const Gap(10),

                    // Display completed hustles
                    DisplayListOfHustle(
                      isCompletedhustle: true,
                      hustles: completedHustles,
                    ),

                    const Gap(20),

                    // Add new hustle button
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

  // Helper method to filter completed hustles
  List<Hustle> _completedhustles(List<Hustle> hustles, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Hustle> filteredHustles = [];

    for (var hustle in hustles) {
      final isHustleDay = Helpers.isHustleFromSelectedDate(
        hustle,
        selectedDate,
      );
      if (hustle.isCompleted && isHustleDay) {
        
          filteredHustles.add(hustle);
        
      }
    }
    return filteredHustles;
  }

  // Helper method to filter incomplete hustles
  List<Hustle> _inCompletedhustles(List<Hustle> hustles, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Hustle> filteredHustles = [];
    
    for (var hustle in hustles) {
      final isHustleDay = Helpers.isHustleFromSelectedDate(
        hustle,
        selectedDate,
      );
      if (!hustle.isCompleted && isHustleDay) {
        filteredHustles.add(hustle);
      }
    }
    return filteredHustles;
  }
}
