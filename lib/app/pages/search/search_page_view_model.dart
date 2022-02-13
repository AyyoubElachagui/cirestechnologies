import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/utils/toast_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:cirestechnologies/data/repository/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SearchPageViewModel({
    required this.navigationService,
  });






  void navigateToHomePage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
