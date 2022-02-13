import 'package:cirestechnologies/app/pages/home/home_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_factory.dart';
import 'package:cirestechnologies/app/widgets/home_news_items/home_news_items_widget.dart';
import 'package:cirestechnologies/app/widgets/loading/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final HomePageViewModel viewModel;

  HomePage({required this.viewModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await widget.viewModel.getListNewsStartUp(context: context);
      await widget.viewModel.getListNewsScience(context: context);
      await widget.viewModel.getListNewsTechnology(context: context);
      await widget.viewModel.getListNewsSports(context: context);
      await widget.viewModel.getListNewsBusiness(context: context);
      await widget.viewModel.getListNewsAutomobile(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenuViewFactory(),
      body: widget.viewModel.listNewsStarUp.isEmpty == false
          ? Container(
              color: AppColors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    widget.viewModel.listNewsScience != null &&
                            widget.viewModel.listNewsScience.length > 0
                        ? Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(widget
                                    .viewModel.listNewsScience[1].imageUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 40,
                                  left: 20,
                                  child: InkWell(
                                      onTap: () {
                                        SharedPreferences.getInstance()
                                            .then((value) => value.clear());
                                        widget.viewModel
                                            .navigateToOnbroadingPage();
                                      },
                                      child: Icon(
                                        Icons.menu,
                                        color: AppColors.white,
                                        size: 35,
                                      )),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 20,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.white.withOpacity(0.5),
                                    ),
                                    child: Text("News of the day",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16)),
                                  ),
                                ),
                                Positioned(
                                  top: 210,
                                  left: 20,
                                  child: Container(
                                    width: 280,
                                    child: Text(
                                        widget.viewModel.listNewsScience
                                                    .length >
                                                0
                                            ? widget.viewModel
                                                .listNewsScience[1].title!
                                            : "",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Learn More",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: AppColors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt,
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : LoadingWidget(),
                    HomeNewsItems(
                      title: "Sciences",
                      listNews: widget.viewModel.listNewsScience,
                    ),
                    HomeNewsItems(
                      title: "Busincess",
                      listNews: widget.viewModel.listNewsBusiness,
                    ),
                    HomeNewsItems(
                      title: "Sports",
                      listNews: widget.viewModel.listNewsSport,
                    ),
                    HomeNewsItems(
                      title: "Technology",
                      listNews: widget.viewModel.listNewsTechnology,
                    ),
                    HomeNewsItems(
                      title: "Start up",
                      listNews: widget.viewModel.listNewsStarUp,
                    ),
                    HomeNewsItems(
                      title: "Auto mobile",
                      listNews: widget.viewModel.listNewsAutoMobile,
                    ),
                  ],
                ),
              ),
            )
          : LoadingWidget(),
    );
  }
}
