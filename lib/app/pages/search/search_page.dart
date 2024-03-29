import 'package:cirestechnologies/app/pages/search/search_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/utils/render_date.dart';
import 'package:cirestechnologies/app/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/search_news_card/search_news_card_widget.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget.viewModel.getListNewsBusiness(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key =
        Provider.of<GlobalKey<ScaffoldState>>(context, listen: true);
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => key.currentState!.openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.black,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Discover",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "News from all over the world",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: widget.viewModel.filter,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (v) {
                      v.isEmpty ? null : widget.viewModel.filterByAuthor(v);
                    },
                    onChanged: (v) async {
                      v.isNotEmpty
                          ? null
                          : widget.viewModel.categorySelected(
                              context: context,
                              index: widget.viewModel.indexCatSelected);
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        border: const OutlineInputBorder(
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
                        suffixIcon: IconButton(
                          onPressed: () async {
                            await widget.viewModel.selectDate(context);
                            String _date =
                                widget.viewModel.selectedDate.toString();
                            _date = _date.split(" ")[0].toString();
                            String dateString = RenderDate(date: _date)
                                .dateTime(dateTime: _date);
                            widget.viewModel.filterList(dateComp: dateString);
                          },
                          icon: Icon(
                            Icons.manage_search_rounded,
                            color: AppColors.gray.withOpacity(0.6),
                            size: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...widget.viewModel.category.map(
                          (e) => InkWell(
                            onTap: () => widget.viewModel.categorySelected(
                              context: context,
                              index: widget.viewModel.category.indexOf(e),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width:
                                            widget.viewModel.indexCatSelected ==
                                                    widget.viewModel.category
                                                        .indexOf(e)
                                                ? 3
                                                : 2,
                                        color:
                                            widget.viewModel.indexCatSelected ==
                                                    widget.viewModel.category
                                                        .indexOf(e)
                                                ? AppColors.black
                                                : AppColors.lightGray,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color:
                                            widget.viewModel.indexCatSelected ==
                                                    widget.viewModel.category
                                                        .indexOf(e)
                                                ? AppColors.black
                                                : AppColors.lightGray,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  widget.viewModel.listNews.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...widget.viewModel.listNews.map(
                              (e) {
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
                                    e: e,
                                    dateString: '${e.date}',
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 30),
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
