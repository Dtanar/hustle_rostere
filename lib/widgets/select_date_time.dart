import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../utils/utils.dart';
import '../providers/providers.dart';

import 'widgets.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            fieldLabel: 'Due Date',
            hintText: DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
              onPressed: () => Helpers.selectDate(context, ref),
              icon: FaIcon(FontAwesomeIcons.calendar),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            fieldLabel: 'Time',
            hintText: Helpers.timeToString(time),
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context,ref),
              icon: FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  
}
