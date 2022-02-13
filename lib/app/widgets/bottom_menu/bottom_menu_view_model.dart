import 'dart:async';

import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';


class BottomMenuViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  int currentIndex;

  BottomMenuViewModel({
    required this.navigationService,
    required this.currentIndex,
  });

  void navigateToPage(int index) {
    currentIndex = index;
    print('------------------------------ check index');
    print(index.toString());
    switch(index){
      case 0:
        navigationService.navigateTo(routeName: Routes.homePage, data: index);
      break;
      case 1:
        navigationService.navigateTo(routeName: Routes.search, data: index);
      break;
      case 2:
        navigationService.navigateTo(routeName: Routes.profile, data: index);
      break;
      default:
        navigationService.navigateTo(routeName: Routes.homePage, data: 0);
      break;

    }
    notifyListeners();
    /*if (navigationService.currentRoute != Routes.homePage) {
      navigationService.navigateToAndMakeRoot(routeName: Routes.homePage);
    }*/
  }

  bool isIndexSelected(int index) {
    return index == currentIndex;
  }
}
