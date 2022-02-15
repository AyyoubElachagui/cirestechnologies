import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:flutter/material.dart';

class NewsDetaileBottomCard extends StatefulWidget {
  final String author;
  final String title;
  final String content;

  NewsDetaileBottomCard({required this.title, required this.author, required this.content});

  @override
  _NewsDetaileBottomCardState createState() => _NewsDetaileBottomCardState();
}

class _NewsDetaileBottomCardState extends State<NewsDetaileBottomCard> {
  late Image fakeOne;
  late Image fakTwo;
  late Image fakeUser;

  @override
  void initState() {
    super.initState();
    fakeOne = Image.asset(ImageAssets.fakeOne, width: 150, height: 150, fit: BoxFit.cover,);
    fakTwo = Image.asset(ImageAssets.fakeTwo, width: 150, height: 150, fit: BoxFit.cover,);
    fakeUser = Image.asset(ImageAssets.fakeUser, width: 25, height: 25, fit: BoxFit.cover,);

  }

  @override
  void didChangeDependencies() {
    precacheImage(fakeOne.image, context);
    precacheImage(fakTwo.image, context);
    precacheImage(fakeUser.image, context);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                        widget.author,
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
              widget.title,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              widget.content,
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
                  child: fakeOne,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: fakTwo,
                )
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
