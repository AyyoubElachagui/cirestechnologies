import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:flutter/material.dart';

class SearchNewsCardWidget extends StatelessWidget {
  final NewsModel e;
  final String dateString;

  SearchNewsCardWidget({required this.e, required this.dateString});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    e.imageUrl!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
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
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        e.title!,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.lightGray,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                dateString,
                                style: TextStyle(
                                    color: AppColors.lightGray, fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.lightGray,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                e.content!.length.toString() + " views",
                                style: TextStyle(
                                    color: AppColors.lightGray, fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
