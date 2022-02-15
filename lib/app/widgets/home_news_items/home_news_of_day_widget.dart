import 'package:cached_network_image/cached_network_image.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class HomeNewsOfDayWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  HomeNewsOfDayWidget({required this.title, required this.imageUrl});



  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = Provider.of<GlobalKey<ScaffoldState>>(context, listen: true);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.54,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) =>
                    Container(
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
                placeholder: (context, url) =>
                    Shimmer.fromColors(
                      baseColor: AppColors.gray,
                      highlightColor: AppColors.lightGrayAccent,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        color: Colors.black26,
                      ),
                    ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () => key.currentState!.openDrawer(),
              icon: Icon(
                Icons.menu,
                color: AppColors.white,
                size: 35,
              ),
            ),
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
                  title,
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
    );
  }
}
