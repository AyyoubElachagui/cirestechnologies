import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_view_model.dart';
import 'package:cirestechnologies/app/pages/news_detail/widget/news_detail_widget.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.3, //
            child: NewsDetailWidget(
              newsDetail: widget.viewModel.newsDetail,
              categoryTitle: widget.viewModel.categoryTitle,
              onTap: () => widget.viewModel.navigateToBack(),
            ),
          ),
        ),
      ),
    );
  }
}
