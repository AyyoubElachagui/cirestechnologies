import 'package:cirestechnologies/app/pages/news_detail/news_detail_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_factory.dart';
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
    print("--------------------------- news detail");
    print(widget.viewModel.newsDetail.author.toString() +
        " " +
        widget.viewModel.categoryTitle);
    return Scaffold(
      body: Container(
          color: AppColors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1.3,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.viewModel.newsDetail.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 40,
                            left: 20,
                            child: InkWell(
                                onTap: () =>
                                    widget.viewModel.navigateToBack(),
                                child: Icon(
                                  Icons.keyboard_backspace,
                                  color: AppColors.white,
                                  size: 30,
                                )),
                          ),
                          Positioned(
                            bottom: 220,
                            left: 20,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.white.withOpacity(0.35),
                              ),
                              child: Text(
                                widget.viewModel.categoryTitle,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 150,
                            left: 20,
                            child: Container(
                              width: 280,
                              child: Text(
                                widget.viewModel.newsDetail.title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            left: 20,
                            child: Container(
                              width: 280,
                              child: Text(
                                widget.viewModel.newsDetail.content ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 450,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: AppColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.black.withOpacity(0.7),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(ImageAssets.fakeUser, width: 25, height: 25, fit: BoxFit.cover,),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                        widget.viewModel.newsDetail.author ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.lightGray.withOpacity(0.4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.timer, size: 20, color: AppColors.lightGray,),
                                    SizedBox(width: 6),
                                    Text(
                                      "2h",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.lightGray.withOpacity(0.4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.remove_red_eye_outlined, size: 20, color: AppColors.lightGray,),
                                    SizedBox(width: 6),
                                    Text(
                                      "376",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(
                              widget.viewModel.newsDetail.title ?? "",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            widget.viewModel.newsDetail.content ?? "",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            widget.viewModel.newsDetail.content ?? "",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
