import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';

class HomePageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  HomePageViewModel({
    required this.navigationService,
  });

  void navigateToHomePage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
