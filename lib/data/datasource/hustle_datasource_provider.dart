import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data.dart';

final hustleDatasourceProvider = Provider<HustleDatasource>((ref) {
  return HustleDatasource();
});
