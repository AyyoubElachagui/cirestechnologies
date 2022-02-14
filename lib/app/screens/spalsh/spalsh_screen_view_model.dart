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

  void navigateToMainAppPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.mainApp);
  }

  void defaultScrenn() async{
    var onbroading , auth;
    await SharedPreferences.getInstance().then((prefValue) => {
      onbroading = prefValue.getBool('onbroading'),
      auth = prefValue.getBool('auth'),
      print("---------------------------- check auth and onbroading"),
      print(onbroading.toString()+"\t"+auth.toString()),
      onbroading == null ? navigateToOnbroadingPage() : auth == null ? navigateToLoginPage() : auth == true ? navigateToMainAppPage() : navigateToLoginPage()
    });
  }
}
