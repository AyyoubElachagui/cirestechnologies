import 'package:cirestechnologies/app/pages/sing_in/sing_in_page.dart';
import 'package:cirestechnologies/app/pages/sing_in/sing_in_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingInFactory {
  static Widget buildScreen(RouteSettings? settings) {
    return ChangeNotifierProvider<SingInPageViewModel>(
      create: (context) {
        return SingInPageViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
        );
      },
      child: Consumer<SingInPageViewModel>(
        builder: (context, model, child) => SingInPage(
          viewModel: model,
        ),
      ),
    );
  }
}
