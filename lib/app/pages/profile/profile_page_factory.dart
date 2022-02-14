import 'package:cirestechnologies/app/pages/profile/profile_page.dart';
import 'package:cirestechnologies/app/pages/profile/profile_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePageFactory {
  static Widget buildPage(RouteSettings? settings) {
    return ChangeNotifierProvider<ProfilePageViewModel>(
      create: (context) {
        return ProfilePageViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
        );
      },
      child: Consumer<ProfilePageViewModel>(
        builder: (context, model, child) => ProfilePage(
          viewModel: model,
        ),
      ),
    );
  }
}
