import 'package:cirestechnologies/app/pages/list_news_category/list_news_category_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/utils/render_date.dart';
import 'package:cirestechnologies/app/widgets/search_news_card/search_news_card_widget.dart';
import 'package:flutter/material.dart';


class ListNewsCategoryPage extends StatelessWidget {
  final ListNewsCategoryPageViewModel viewModel;

  ListNewsCategoryPage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
            viewModel.categoryTitle
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...viewModel.newsDetail.map(
                      (e) {
                    String firstDate = e.date!.split(",")[0];
                    String monthName = firstDate.split(' ')[1];
                    String dateString = RenderDate(date: e.date!)
                        .jiffyDate(monthName: monthName);
                    return InkWell(
                        onTap: ()
                    =>
                        viewModel
                            .navigateToNewsDetail(
                          model: e,
                          titleCategory: viewModel
                              .categoryTitle,),
                          child: SearchNewsCardWidget(
                            e: e, dateString: dateString,),
                        );
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}
