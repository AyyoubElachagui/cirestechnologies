import 'package:cirestechnologies/app/pages/search/search_page.dart';
import 'package:cirestechnologies/app/pages/search/search_page_view_model.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPageFactory {
  static Widget buildPage(RouteSettings? settings) {
    return ChangeNotifierProvider<SearchPageViewModel>(
      create: (context) {
        return SearchPageViewModel(
          navigationService:
          Provider.of<NavigationService>(context, listen: false),
        );
      },
      child: Consumer<SearchPageViewModel>(
        builder: (context, model, child) => SearchPage(
          viewModel: model,
        ),
      ),
    );
  }
}
