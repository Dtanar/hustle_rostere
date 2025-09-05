import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final TaskCategories category;
  final bool isCompleted;
  final String createdAt;

  const Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.category,
    required this.isCompleted,
    required this.createdAt,
  });

  @override
  List<Object?> get props {
    return [id!, title, note, time, isCompleted, createdAt];
  }
}
