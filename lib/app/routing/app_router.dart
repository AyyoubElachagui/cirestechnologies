import 'package:cirestechnologies/app/pages/home/home_page_factory.dart';
import 'package:cirestechnologies/app/pages/list_news_category/list_news_category_page_factory.dart';
import 'package:cirestechnologies/app/pages/main_app.dart';
import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_factory.dart';
import 'package:cirestechnologies/app/pages/profile/profile_page_factory.dart';
import 'package:cirestechnologies/app/pages/search/search_page_factory.dart';
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

      case Routes.mainApp:
        page = MainApp();
        break;

      case Routes.homePage:
        page = HomePageFactory.buildPage(settings);
        break;

      case Routes.listNews:
        page = ListNewsCategoryPageFactory.buildPage(settings);
        break;

      case Routes.search:
        page = SearchPageFactory.buildPage(settings);
        break;

      case Routes.profile:
        page = ProfilePageFactory.buildPage(settings);
        break;

      case Routes.newsDetail:
        page = NewsDetailPageFactory.buildPage(settings);
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