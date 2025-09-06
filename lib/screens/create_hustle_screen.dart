import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todosql/widgets/widgets.dart';

class CreateHustleScreen extends StatelessWidget {
  static CreateHustleScreen builder(BuildContext context, GoRouterState state) =>
      const CreateHustleScreen();
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
      body: Center(child: Text('Create Hustle Screen')),
    );
  }
}
