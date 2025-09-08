import 'package:equatable/equatable.dart';
import '/data/data.dart';

class HustleState extends Equatable {
  final List<Hustle> hustles;

  const HustleState(this.hustles);
  const HustleState.initial({this.hustles = const []});

  HustleState copyWith({List<Hustle>? hustles}) {
    return HustleState(hustles ?? this.hustles);
  }

  @override
  List<Object> get props => [hustles];
}
