import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data.dart';
import '../hustle/hustle.dart';

final hustleProvider = StateNotifierProvider<HustleNotifier, HustleState>((
  ref,
) {
  final repository = ref.watch(hustleRepositoryProvider);
  return HustleNotifier(repository);
});
