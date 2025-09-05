import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todosql/data/models/task.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                    DisplayWhiteText(
                      text: 'Sep 02, 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
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
                    DisplayListOfTask(
                      tasks: [
                        Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          isCompleted: false,
                          dueDate: 'createdAt',
                          category: TaskCategories.work,
                        ),
                        Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          isCompleted: false,
                          dueDate: 'createdAt',
                          category: TaskCategories.education,
                        ),
                      ],
                    ),

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

                    DisplayListOfTask(
                      isCompletedTask: true,
                      tasks: [
                        Task(
                          title: 'title',
                          note: '',
                          time: 'time',
                          isCompleted: true,
                          dueDate: '2025-09-05',
                          category: TaskCategories.work,
                        ),
                      ],
                    ),

                    const Gap(20),

                    ElevatedButton(
                      onPressed: () {},
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
