import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._internal();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static final _instance = NavigationService._internal();

  factory NavigationService() => _instance;

  String get currentRoute {
    String currentRoute = '';
    navigatorKey.currentState?.popUntil((route) {
      currentRoute = route.settings.name ?? 'no current route';
      return true;
    });
    return currentRoute;
  }

  Future<dynamic> navigateTo({
    required String routeName,
    bool isBackNavigationAllowed = true,
    dynamic data,
  }) {
    return isBackNavigationAllowed
        ? navigatorKey.currentState!.pushNamed(routeName, arguments: data)
        : navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: data);
  }

  Future<dynamic> navigateToAndMakeRoot({
    required String routeName,
    dynamic data,
  }) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: data);
  }

  void navigateBack({result}) {
    navigatorKey.currentState!.pop(result);
  }
}