import 'package:cirestechnologies/app/pages/home/home_page_factory.dart';
import 'package:cirestechnologies/app/pages/sing_in/sing_in_page_factory.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/screens/obroad/onbroading_screen_factory.dart';
import 'package:cirestechnologies/app/screens/spalsh/splash_screen_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Widget? page;

    switch (settings.name) {
      case Routes.onbroadingScreen:
        page = OnbroadingScreenFactory.buildScreen(settings);
        break;

      case Routes.singIn:
        page = SingInFactory.buildScreen(settings);
        break;

      case Routes.homePage:
        page = HomePageFactory.buildScreen(settings);
        break;

      default:
        return null;
    }

    return MaterialPageRoute(builder: (_) => page!, settings: settings);
  }

  static Widget buildSplashPage() {
    return SplashFactory.buildSplashPage(null);
  }
}