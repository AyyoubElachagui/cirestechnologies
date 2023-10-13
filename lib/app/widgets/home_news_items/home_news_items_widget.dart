import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/news_card/news_card_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';

class HomeNewsItems extends StatelessWidget {
  String title;
  List<NewsModel> listNews;

  HomeNewsItems({Key? key, required this.listNews, required this.title})
      : super(key: key);

  late NavigationService navigationService = NavigationService();

  void navigateToNewsDetail({
    required NewsModel model,
    required String category,
    required String indexHero,
  }) {
    navigationService.navigateTo(
        routeName: Routes.newsDetail, data: [category, model, indexHero]);
  }

  void navigateToListNews({
    required List<NewsModel> listModel,
    required String category,
  }) {
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
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () => navigateToListNews(
                          listModel: listNews, category: title),
                      child: const Text(
                        "More",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  child: Row(
                    children: [
                      ...listNews.map((e) {
                        return Hero(
                          tag: '${listNews.indexOf(e)}$title',
                          child: InkWell(
                            onTap: () => navigateToNewsDetail(
                                category: title,
                                model: e,
                                indexHero: '${listNews.indexOf(e)}$title'),
                            child: NewsCardWidget(
                              e: e,
                              dateString: '${e.date}',
                            ),
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
