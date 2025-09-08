import 'package:flutter/material.dart';
import 'utils.dart';

@immutable
class DBKeys {
  const DBKeys._();

  static const String dbTable = 'hustles';
  static const String dbName = 'hustles.db';
  static const String idColumn = HustleKeys.id;
  static const String titleColumn = HustleKeys.title;
  static const String noteColumn = HustleKeys.note;
  static const String timeColumn = HustleKeys.time;
  static const String dateColumn = HustleKeys.date;
  static const String categoriesColumn = HustleKeys.categories;
  static const String isCompletedColumn = HustleKeys.isCompleted;
}
