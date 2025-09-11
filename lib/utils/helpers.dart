import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todosql/data/data.dart';

import '../providers/providers.dart';

class Helpers {
  Helpers._();

  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      return DateFormat.jm().format(date);
    } catch (e) {
      return '00:00 am';
    }
  }

  static bool isHustleFromSelectedDate(Hustle hustle, DateTime selectedDate) {
    final DateTime hustleDate = _stringToDateTime(hustle.dueDate);
    if (hustleDate.year == selectedDate.year &&
        hustleDate.month == selectedDate.month &&
        hustleDate.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  static DateTime _stringToDateTime(String dateString) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}
