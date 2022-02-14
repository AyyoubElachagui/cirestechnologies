import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailWidget extends StatelessWidget {
  final NewsModel newsDetail;
  final String categoryTitle;
  final Function onTap;

  NewsDetailWidget({required this.categoryTitle, required this.onTap, required this.newsDetail});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    newsDetail.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 20,
                  child: InkWell(
                      onTap: () => onTap(),
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
                      categoryTitle,
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
                      newsDetail.title ?? "",
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
                      newsDetail.content ?? "",
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
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                            newsDetail.author ?? "",
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
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  newsDetail.title ?? "",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  newsDetail.content ?? "",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(ImageAssets.fakeOne, width: 150, height: 150, fit: BoxFit.cover,),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(ImageAssets.fakeTwo, width: 150, height: 150, fit: BoxFit.cover,),
                    )
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
