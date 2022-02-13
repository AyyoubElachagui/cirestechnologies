import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils{
  FToast fToast = FToast();

  @override
  noSuchMethod(Invocation invocation) {
    // TODO: implement noSuchMethod
    return super.noSuchMethod(invocation);
  }

  void launchToast({required BuildContext context, required String? title, required IconData? icon, required Color? backgroundColor, }){
    _showToast(context: context,title: title, icon: icon, backgroundColor: backgroundColor);
  }

  _showToast({required BuildContext context,required String? title, required IconData? icon, required Color? backgroundColor,}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.white),
          SizedBox(
            width: 12.0,
          ),
          Text(
              title ?? "",
            style: TextStyle(
              color: AppColors.white
            ),
          )
        ],
      ),
    );


    fToast.init(context);
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );


  }
}