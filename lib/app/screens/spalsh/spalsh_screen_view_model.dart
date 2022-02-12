import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SplashViewModel({
    required this.navigationService,
  });
  void navigateToLoginPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.singIn);
  }

  void navigateToOnbroadingPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }

  void defaultScrenn() async{
    var token;
    await SharedPreferences.getInstance().then((prefValue) => {
      token = prefValue.getBool('onbroading'),
    });
    token == null ? navigateToOnbroadingPage() : navigateToLoginPage();
  }
}
