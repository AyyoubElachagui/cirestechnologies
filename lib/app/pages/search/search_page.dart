import 'package:cirestechnologies/app/pages/search/search_page_view_model.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_factory.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/utils/render_date.dart';
import 'package:cirestechnologies/app/widgets/loading/loading_widget.dart';
import 'package:cirestechnologies/app/widgets/search_news_card/search_news_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  final SearchPageViewModel viewModel;

  SearchPage({required this.viewModel});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await widget.viewModel.getListNewsScience(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    SharedPreferences.getInstance()
                        .then((value) => value.clear());
                    //widget.viewModel
                    //.navigateToOnbroadingPage();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.black,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "News from all over the world",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: widget.viewModel.filter,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.lightGrayAccent,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.gray.withOpacity(0.6)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.gray.withOpacity(0.6),
                          ),
                          suffixIcon: Icon(
                            Icons.manage_search_rounded,
                            color: AppColors.gray.withOpacity(0.6),
                            size: 35,
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...widget.viewModel.category.map((e) => InkWell(
                                  onTap: () =>
                                      widget.viewModel.categorySelected(
                                    context: context,
                                    index: widget.viewModel.category.indexOf(e),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: widget.viewModel
                                                      .indexCatSelected ==
                                                  widget.viewModel.category
                                                      .indexOf(e)
                                              ? 2
                                              : 2,
                                          color: widget.viewModel
                                                      .indexCatSelected ==
                                                  widget.viewModel.category
                                                      .indexOf(e)
                                              ? AppColors.black
                                              : AppColors.lightGray,
                                        ))),
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.gray,
                                            fontSize: 18
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    widget.viewModel.listNews.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...widget.viewModel.listNews.map(
                                (e) {
                                  String firstDate = e.date!.split(",")[0];
                                  String monthName = firstDate.split(' ')[1];
                                  String dateString = RenderDate(date: e.date!)
                                      .jiffyDate(monthName: monthName);
                                  return InkWell(
                                    onTap: () => widget.viewModel
                                        .navigateToNewsDetail(
                                            model: e,
                                            titleCategory: widget
                                                .viewModel
                                                .category[widget
                                                    .viewModel.indexCatSelected]
                                                .toString()),
                                    child: SearchNewsCardWidget(
                                        e: e, dateString: dateString),
                                  );
                                },
                              ),
                              Text(widget.viewModel.listNews.length.toString()),
                            ],
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Center(
                              child: LoadingWidget(),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
