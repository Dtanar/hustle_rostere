import 'package:equatable/equatable.dart';
import 'package:todosql/utils/utils.dart'; 



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
      HustleKeys.isCompleted: isCompleted ? 1: 0,
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
      isCompleted: map[HustleKeys.isCompleted] == 1 ? true: false,
      dueDate: map[HustleKeys.date],
    );
  }

Hustle copyWith({
  int? id,
    String? title,
    String? note,
    HustleCategories? category,
    String? time,
    String? dueDate,
    bool? isCompleted,
  }) {
    return Hustle(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      time: time ?? this.time,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
