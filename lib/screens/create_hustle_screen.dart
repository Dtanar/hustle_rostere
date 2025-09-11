import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todosql/config/config.dart';
import 'package:todosql/data/models/hustle.dart';
import 'package:todosql/providers/date_provider.dart';
import 'package:todosql/providers/providers.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class CreateHustleScreen extends ConsumerStatefulWidget {
  static CreateHustleScreen builder(
    BuildContext context,
    GoRouterState state,
  ) => const CreateHustleScreen();
  const CreateHustleScreen({super.key});

  @override
  ConsumerState<CreateHustleScreen> createState() => _CreateHustleScreenState();
}

class _CreateHustleScreenState extends ConsumerState<CreateHustleScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(
          text: 'Create Hustle',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                fieldLabel: 'Hustle Tile',
                hintText: 'Enter Hustle ',
                controller: _titleController,
              ),

              const Gap(16),

              SelectCategory(),

              const Gap(16),

              SelectDateTime(),

              const Gap(16),

              CommonTextField(
                fieldLabel: 'Note',
                hintText: 'Enter a description ',
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: _createHustle,
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
      ),
    );
  }

  void _createHustle() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final hustle = Hustle(
        title: title,
        note: note,
        time: Helpers.timeToString(time),
        category: category,
        isCompleted: false,
        dueDate: DateFormat.yMMMd().format(date),
      );

      await ref.read(hustleProvider.notifier).createHustle(hustle).then((
        value,
      ) {
        AppAlerts.displaySnackBar(context, 'Hustle Created Successfully');
        context.go(RoutesLocation.home);
      });
    } else {
      AppAlerts.displaySnackBar(context, 'Hustle title cannot be empty');
    }
  }
}
