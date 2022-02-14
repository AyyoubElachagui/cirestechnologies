import 'package:cirestechnologies/app/pages/list_news_category/list_news_category_page.dart';
import 'package:cirestechnologies/app/pages/list_news_category/list_news_category_page_view_model.dart';
import 'package:cirestechnologies/app/pages/news_detail/news_detail_page.dart';
import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListNewsCategoryPageFactory {
  static Widget buildPage(RouteSettings? settings) {
    final data = settings!.arguments as List;
    String categoryTitle = data[0];
    List<NewsModel> newsDetail = data[1];
    return ChangeNotifierProvider<ListNewsCategoryPageViewModel>(
      create: (context) {
        return ListNewsCategoryPageViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
          newsDetail: newsDetail,
          categoryTitle: categoryTitle,
        );
      },
      child: Consumer<ListNewsCategoryPageViewModel>(
        builder: (context, model, child) => ListNewsCategoryPage(
          viewModel: model,
        ),
      ),
    );
  }
}
