import 'package:cirestechnologies/app/pages/news_detail/news_detail_page.dart';
import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsDetailPageFactory {
  static Widget buildPage(RouteSettings? settings) {
    final data = settings!.arguments as List;
    String categoryTitle = data[0];
    NewsModel newsDetail = data[1];
    String indexHero = '${newsDetail.title}';
    return ChangeNotifierProvider<NewsDetailPageViewModel>(
      create: (context) {
        return NewsDetailPageViewModel(
          navigationService:
              Provider.of<NavigationService>(context, listen: false),
          indexHero: indexHero,
          newsDetail: newsDetail,
          categoryTitle: categoryTitle,
        );
      },
      child: Consumer<NewsDetailPageViewModel>(
        builder: (context, model, child) => NewsDetailPage(
          viewModel: model,
        ),
      ),
    );
  }
}
