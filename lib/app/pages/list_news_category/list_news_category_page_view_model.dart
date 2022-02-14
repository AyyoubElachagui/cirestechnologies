import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/cupertino.dart';

class ListNewsCategoryPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  final List<NewsModel> newsDetail;
  final String categoryTitle;

  ListNewsCategoryPageViewModel({
    required this.navigationService,
    required this.newsDetail,
    required this.categoryTitle,
  });

  void navigateToNewsDetail({required NewsModel model, required String titleCategory}){
    navigationService.navigateTo(routeName: Routes.newsDetail, data: [titleCategory,model]);
  }

  void navigateToBack() {
    navigationService.navigateBack();
  }
}
