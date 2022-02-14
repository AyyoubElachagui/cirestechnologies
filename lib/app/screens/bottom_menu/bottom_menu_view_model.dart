import 'dart:async';

import 'package:cirestechnologies/app/pages/home/home_page.dart';
import 'package:cirestechnologies/app/pages/home/home_page_factory.dart';
import 'package:cirestechnologies/app/pages/profile/profile_page_factory.dart';
import 'package:cirestechnologies/app/pages/search/search_page_factory.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';


class BottomMenuViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  int currentIndex = 0;

  BottomMenuViewModel({
    required this.navigationService,
    required this.currentIndex,
  });

  void navigateToPage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool isIndexSelected(int index) {
    return index == currentIndex;
  }
}
