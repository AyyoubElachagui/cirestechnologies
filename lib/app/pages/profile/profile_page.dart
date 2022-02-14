import 'package:cirestechnologies/app/pages/profile/profile_page_view_model.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_factory.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatefulWidget {
  final ProfilePageViewModel viewModel;

  ProfilePage({required this.viewModel});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(ImageAssets.fakeUser, width: 150, height: 150, fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Firstname: Ayyoub",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                fontSize: 18
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Lastname: El Achagui",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 18
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Profil: Software engineer",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 18
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                SharedPreferences.getInstance().then((value) => value.clear());
                widget.viewModel.navigateToOnbroading();
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGrayAccent,
                ),
                height: 60,
                child: Center(
                  child: Text(
                    "Go to onbroading",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                SharedPreferences.getInstance().then((value) => value.setBool("auth", false));
                widget.viewModel.navigateToSingIn();
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGrayAccent,
                ),
                height: 60,
                child: Center(
                  child: Text(
                    "Log out",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
