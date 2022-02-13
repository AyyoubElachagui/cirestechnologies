import 'package:cirestechnologies/app/pages/news_detail/news_detail_page.dart';
import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsDetailPageFactory {
  static Widget buildPage(RouteSettings? settings) {
    NewsModel data = settings!.arguments as NewsModel;
    return ChangeNotifierProvider<NewsDetailPageViewModel>(
      create: (context) {
        return NewsDetailPageViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
          newsDetail: data
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
