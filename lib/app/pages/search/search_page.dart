import 'package:cirestechnologies/app/pages/search/search_page_view_model.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_factory.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final SearchPageViewModel viewModel;

  SearchPage({required this.viewModel});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenuViewFactory(),
      body: Container(
        child: Center(
          child: Text("Search page"),
        )
      )
    );
  }
}
