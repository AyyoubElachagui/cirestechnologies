import 'package:cirestechnologies/app/pages/home/home_page.dart';
import 'package:cirestechnologies/app/pages/home/home_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/screens/obroad/onbroading_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageFactory {
  static Widget buildScreen(RouteSettings? settings) {
    MaterialPageRoute? pageRoute;
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (context) {
        return HomePageViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
        );
      },
      child: Consumer<HomePageViewModel>(
        builder: (context, model, child) => HomePage(
          viewModel: model,
        ),
      ),
    );
  }
}
