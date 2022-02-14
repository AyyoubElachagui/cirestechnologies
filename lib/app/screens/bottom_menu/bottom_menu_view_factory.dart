import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomMenuViewFactory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomMenuViewModel =
    Provider.of<BottomMenuViewModel>(context);
    return BottomMenuView(
      viewModel: _bottomMenuViewModel,
    );
  }
}
