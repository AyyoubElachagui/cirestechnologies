import 'package:cirestechnologies/app/pages/home/home_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/home_news_items/home_news_items_widget.dart';
import 'package:cirestechnologies/app/widgets/home_news_items/home_news_of_day_widget.dart';
import 'package:cirestechnologies/app/widgets/loading/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomePageViewModel viewModel;

  HomePage({required this.viewModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget.viewModel.getListNewsStartUp(context: context);
      await widget.viewModel.getListNewsTechnology(context: context);
      await widget.viewModel.getListNewsSports(context: context);
      await widget.viewModel.getListNewsBusiness(context: context);
      await widget.viewModel.getListNewsAutomobile(context: context);
      setState(() => index = widget.viewModel
          .random(0, widget.viewModel.listNewsSport.length - 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.viewModel.listNewsTechnology.isNotEmpty
        ? Container(
            color: AppColors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  HomeNewsOfDayWidget(
                    model: widget.viewModel.listNewsTechnology[index ?? 2],
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
        : LoadingWidget();
  }
}
