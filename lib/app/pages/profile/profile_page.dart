import 'package:cirestechnologies/app/pages/profile/profile_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_factory.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  final ProfilePageViewModel viewModel;

  ProfilePage({required this.viewModel});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenuViewFactory(),
      body: Container(
          color: AppColors.white,
          child: Center(
              child: Text(
                  "Profile page"
              )
          )
      ),
    );
  }
}
