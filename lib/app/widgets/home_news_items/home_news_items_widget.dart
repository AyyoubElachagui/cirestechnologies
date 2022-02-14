import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/utils/render_date.dart';
import 'package:cirestechnologies/app/widgets/news_card/news_card_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';

class HomeNewsItems extends StatelessWidget {
  String title;
  List<NewsModel> listNews;

  HomeNewsItems({required this.listNews, required this.title});

  late NavigationService navigationService = NavigationService();

  void navigateToNewsDetail(
      {required NewsModel model, required String category}) {
    navigationService
        .navigateTo(routeName: Routes.newsDetail, data: [category, model]);
  }

  void navigateToListNews(
      {required List<NewsModel> listModel, required String category}) {
    navigationService
        .navigateTo(routeName: Routes.listNews, data: [category, listModel]);
  }

  @override
  Widget build(BuildContext context) {
    return listNews.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black)),
                    InkWell(
                      onTap: () => navigateToListNews(listModel: listNews, category: title),
                      child: Text("More",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  child: Row(
                    children: [
                      ...listNews.map((e) {
                        String firstDate = e.date!.split(",")[0];
                        String monthName = firstDate.split(' ')[1];
                        String dateString = RenderDate(date: e.date!)
                            .jiffyDate(monthName: monthName);
                        return InkWell(
                          onTap: () =>
                              navigateToNewsDetail(category: title, model: e),
                          child: NewsCardWidget(
                            e: e,
                            dateString: dateString,
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
