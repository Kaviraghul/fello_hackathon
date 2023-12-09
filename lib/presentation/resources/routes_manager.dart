import 'package:fello_hackathon/presentation/home/home.dart';
import 'package:fello_hackathon/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String mainRoute = "/";
  static const String goalCreationRoute = "/goal_creation";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text(AppString.noRouteFound)),
              body: const Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
