import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';

class SingInPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SingInPageViewModel({
    required this.navigationService,
  });

  void navigateToOnbroadingScreenPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
