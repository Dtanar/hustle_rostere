import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class Hustle extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final HustleCategories category;
  final bool isCompleted;
  final String dueDate;

  const Hustle({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.category,
    required this.isCompleted,
    required this.dueDate,
  });

  @override
  List<Object?> get props {
    return [id!, title, note, time, isCompleted, dueDate];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      HustleKeys.id: id,
      HustleKeys.title: title,
      HustleKeys.note: note,
      HustleKeys.time: time,
      HustleKeys.categories: category.name,
      HustleKeys.isCompleted: isCompleted,
      HustleKeys.date: dueDate,
    };
  }

  factory Hustle.fromJson(Map<String, dynamic> map) {
    return Hustle(
      id: map[HustleKeys.id],
      title: map[HustleKeys.title],
      note: map[HustleKeys.note],
      time: map[HustleKeys.time],
      category: HustleCategories.stringToCategory(map[HustleKeys.categories]),
      isCompleted: map[HustleKeys.isCompleted],
      dueDate: map[HustleKeys.date],
    );
  }
}
