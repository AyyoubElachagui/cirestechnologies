import 'package:cirestechnologies/app/screens/spalsh/spalsh_screen_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final SplashViewModel viewModel;

  SplashPage({
    required this.viewModel,
  });

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      widget.viewModel.defaultScrenn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.primary, strokeWidth: 1,),
      ),
    );
  }
}
