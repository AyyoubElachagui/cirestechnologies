import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/cupertino.dart';

class NewsDetailPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  final NewsModel newsDetail;
  final String categoryTitle;

  NewsDetailPageViewModel({
    required this.navigationService,
    required this.newsDetail,
    required this.categoryTitle,
  });

  void navigateToBack() {
    navigationService.navigateBack();
  }
}
