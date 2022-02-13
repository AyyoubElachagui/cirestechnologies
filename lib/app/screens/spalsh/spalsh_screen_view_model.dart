import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SplashViewModel({
    required this.navigationService,
  });


  void navigateToOnbroadingPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }

  void navigateToLoginPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.singIn);
  }

  void navigateToHomePage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.homePage);
  }

  void defaultScrenn() async{
    var onbroading , auth;
    await SharedPreferences.getInstance().then((prefValue) => {
      onbroading = prefValue.getBool('onbroading'),
      auth = prefValue.getBool('auth')
    });
    onbroading == null ? navigateToOnbroadingPage() : auth == null ? navigateToLoginPage() : navigateToHomePage();
  }
}
