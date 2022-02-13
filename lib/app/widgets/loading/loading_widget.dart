import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/material.dart';


class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: CircularProgressIndicator(color: AppColors.primary, strokeWidth: 1,),),);
  }
}
