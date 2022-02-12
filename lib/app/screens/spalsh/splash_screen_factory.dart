import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/screens/spalsh/spalsh_screen.dart';
import 'package:cirestechnologies/app/screens/spalsh/spalsh_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashFactory {
  static Widget buildSplashPage(RouteSettings? settings) {
    return ChangeNotifierProvider<SplashViewModel>(
      create: (context) {
        return SplashViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
        );
      },
      child: Consumer<SplashViewModel>(
        builder: (context, model, child) => SplashPage(
          viewModel: model,
        ),
      ),
    );
  }
}
