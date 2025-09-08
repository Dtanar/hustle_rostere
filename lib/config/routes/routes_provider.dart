import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../config.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutesLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
