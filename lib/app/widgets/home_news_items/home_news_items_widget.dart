import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/home_news_items/render_month_to_number.dart';
import 'package:cirestechnologies/app/widgets/loading/loading_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class HomeNewsItems extends StatelessWidget {
  String title;
  List<NewsModel> listNews;

  HomeNewsItems({required this.listNews, required this.title});


  late NavigationService navigationService = NavigationService();

  void navigateToNewsDetail({required NewsModel model, required String category}){
    navigationService.navigateTo(routeName: Routes.newsDetail, data: [category, model]);
  }

  @override
  Widget build(BuildContext context) {
    return listNews != null ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black
                )
              ),
              Text(
                  "More",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black
                  )
              ),
            ],
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            child: Row(
              children: [
                ...listNews.map((e) {
                  ///.parse(e.date!
                  String firstDate = e.date!.split(",")[0];
                  String day = firstDate.split(' ')[0];
                  String monthName = firstDate.split(' ')[1];
                  int month = RenderMonthToNumber().render(monthName: monthName);
                  String year = firstDate.split(' ')[2];
                  var date = Jiffy(year+"-"+month.toString()+"-"+day).format("yyyy-MM-dd");
                  var dateString = Jiffy(date, "yyyy-MM-dd").startOf(Units.DAY).fromNow().toString();
                  return InkWell(
                    onTap: () => navigateToNewsDetail(category: title, model: e),
                    child: Container(
                      width: 210,
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(e.imageUrl!.substring(0,e.imageUrl!.length - 1), width: 210, height: 100, fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                          Text(
                              e.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13
                              )
                          ),
                          SizedBox(height: 5,),
                          Text(
                              dateString,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: AppColors.gray.withOpacity(0.7)
                              )
                          ),
                          SizedBox(height: 5,),
                          Text(
                              "by "+e.author!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: AppColors.gray.withOpacity(0.7)
                              )
                          ),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ),
                  );
                }).toList()
              ],
            ),
          ),
        ],
      ),
    ) : LoadingWidget();
  }
}
