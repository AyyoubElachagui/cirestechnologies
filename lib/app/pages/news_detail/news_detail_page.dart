import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_factory.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsDetailPageViewModel viewModel;

  NewsDetailPage({required this.viewModel});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    print("--------------------------- news detail");
    print(widget.viewModel.newsDetail.author);
    return Scaffold(
      body: Container(
          color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Text(
          "News detail page"
        )
      ),
    );
  }
}
