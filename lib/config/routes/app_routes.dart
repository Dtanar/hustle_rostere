import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:todosql/screens/screens.dart';
import 'routes.dart';

final navigationKey = GlobalKey<NavigatorState>();

// setting up the routes
final appRoutes = [
  GoRoute(
    path: RoutesLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RoutesLocation.createHustle,
    parentNavigatorKey: navigationKey,
    builder: CreateHustleScreen.builder,
  ),
];
