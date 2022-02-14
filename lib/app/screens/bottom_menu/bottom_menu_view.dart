import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:flutter/material.dart';

class BottomMenuView extends StatefulWidget {
  final BottomMenuViewModel viewModel;

  BottomMenuView({
    required this.viewModel,
  });

  @override
  _BottomMenuViewState createState() => _BottomMenuViewState();
}

class _BottomMenuViewState extends State<BottomMenuView> {

  Widget _buildIconItem({
    required int index,
    required String iconActive,
    required String iconUnactive,
  }) {
    return GestureDetector(
      onTap: ()  => widget.viewModel.navigateToPage(index),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(
            widget.viewModel.isIndexSelected(index) ? iconActive : iconUnactive,
          color: AppColors.black,
          height: 25,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        height: 58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconItem(
                  index: 0,
                  iconActive: ImageAssets.home,
                  iconUnactive: ImageAssets.homeOutline,
                ),
                _buildIconItem(
                  index: 1,
                  iconActive: ImageAssets.search,
                  iconUnactive: ImageAssets.searchOutline,
                ),
                _buildIconItem(
                  index: 2,
                  iconActive: ImageAssets.user,
                  iconUnactive: ImageAssets.userOutline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
