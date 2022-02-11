import 'package:flutter/material.dart';

class OnbroadingSreenData extends StatefulWidget {
  final imagePath;
  final subTitle;
  final title;
  final desc;

  OnbroadingSreenData({required this.imagePath, required this.title, required this.desc, required this.subTitle});

  @override
  _OnbroadingSreenDataState createState() => _OnbroadingSreenDataState();
}

class _OnbroadingSreenDataState extends State<OnbroadingSreenData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.subTitle,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
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
            height: 6.0,
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
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.desc,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
