import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';

class ProfilePageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  ProfilePageViewModel({
    required this.navigationService,
  });

  void navigateToOnbroading(){
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }

  void navigateToSingIn(){
    navigationService.navigateToAndMakeRoot(routeName: Routes.singIn);
  }
}
