import 'package:cached_network_image/cached_network_image.dart';
import 'package:cirestechnologies/app/pages/news_detail/widget/news_detaile_bottom_card.dart';
import 'package:cirestechnologies/app/pages/news_detail/widget/news_detaile_top_card.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsDetailWidget extends StatefulWidget {
  final NewsModel newsDetail;
  final String categoryTitle;
  final Function onTap;

  NewsDetailWidget(
      {required this.categoryTitle,
      required this.onTap,
      required this.newsDetail});

  @override
  State<NewsDetailWidget> createState() => _NewsDetailWidgetState();
}

class _NewsDetailWidgetState extends State<NewsDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: CachedNetworkImage(
                      imageUrl: widget.newsDetail.imageUrl!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.red, BlendMode.colorBurn)),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: AppColors.gray,
                        highlightColor: AppColors.lightGrayAccent,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          color: Colors.black26,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: InkWell(
                      onTap: () => widget.onTap(),
                      //widget.viewModel.navigateToBack(),
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
                      widget.categoryTitle,
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
                      widget.newsDetail.title ?? "",
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
                      widget.newsDetail.content ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),*/
        NewsDetaileTopCard(
          title: widget.newsDetail.title!,
          content: widget.newsDetail.content!,
          imageUrl: widget.newsDetail.imageUrl!,
          onTap: () => widget.onTap(),
          categoryTitle: widget.categoryTitle,
        ),
        NewsDetaileBottomCard(
          title: widget.newsDetail.title ?? "",
          author: widget.newsDetail.author ?? "",
          content: widget.newsDetail.content ?? "",
        ),
      ],
    );
  }
}
