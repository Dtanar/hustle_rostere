import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosql/data/data.dart';

final hustleRepositoryProvider = Provider<HustleRepository>((ref) {
  final datasource = ref.watch(hustleDatasourceProvider);
  return HustleRepositoriesImpl(datasource);
});
