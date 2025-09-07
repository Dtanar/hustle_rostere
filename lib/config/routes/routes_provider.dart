import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todosql/config/routes/app_routes.dart';
import 'package:todosql/config/routes/routes_location.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutesLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
