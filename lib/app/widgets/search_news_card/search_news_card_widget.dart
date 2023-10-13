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
                  child: Image.network(e.imageUrl!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                          Widget child, ImageChunkEvent? loadingProgress) {
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
                  }),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        e.title!,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: AppColors.lightGray,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                dateString,
                                style: const TextStyle(
                                  color: AppColors.lightGray,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.lightGray,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                e.content!.length.toString() + " views",
                                style: const TextStyle(
                                  color: AppColors.lightGray,
                                  fontSize: 11,
                                ),
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
