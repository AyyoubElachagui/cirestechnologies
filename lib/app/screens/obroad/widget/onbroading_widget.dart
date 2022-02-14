import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class OnbroadingWidget extends StatefulWidget {
  final imagePath;
  final subTitle;
  final title;
  final desc;

  OnbroadingWidget({required this.imagePath, required this.title, required this.desc, required this.subTitle});

  @override
  _OnbroadingWidgetState createState() => _OnbroadingWidgetState();
}

class _OnbroadingWidgetState extends State<OnbroadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.subTitle,
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              image: AssetImage(widget.imagePath),
            ),
            SizedBox(
              height: 12.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.desc,
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
