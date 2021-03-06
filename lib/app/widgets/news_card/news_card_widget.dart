import 'package:cached_network_image/cached_network_image.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel e;
  final String dateString;

  NewsCardWidget({required this.e, required this.dateString});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 210,
              height: 100,
              imageUrl: e.imageUrl!.substring(0, e.imageUrl!.length - 1),
              imageBuilder: (context, imageProvider) => Container(
                width: 210,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
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
            ) /*Image.network(
              e.imageUrl!.substring(0, e.imageUrl!.length - 1),
              width: 210,
              height: 100,
              fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 210,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrayAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    ),
                  );
                }
            )*/
            ,
          ),
          SizedBox(
            height: 10,
          ),
          Text(e.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
          SizedBox(
            height: 5,
          ),
          Text(dateString,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: AppColors.gray.withOpacity(0.7))),
          SizedBox(
            height: 5,
          ),
          Text("by " + e.author!,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: AppColors.gray.withOpacity(0.7))),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
