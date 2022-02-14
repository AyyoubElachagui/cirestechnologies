import 'package:cirestechnologies/app/pages/home/home_page_factory.dart';
import 'package:cirestechnologies/app/pages/profile/profile_page_factory.dart';
import 'package:cirestechnologies/app/pages/search/search_page_factory.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_factory.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final NavigationService navigationService = NavigationService();

  void navigateToOnbroading(){
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }

  void navigateToSingIn(){
    navigationService.navigateToAndMakeRoot(routeName: Routes.singIn);
  }

  @override
  Widget build(BuildContext context) {
    final _mainBottomMenuViewModel = Provider.of<BottomMenuViewModel>(context);

    print(_mainBottomMenuViewModel.currentIndex);

    Widget _buildBody() {
      switch (_mainBottomMenuViewModel.currentIndex) {
        case 0:
          return HomePageFactory.buildPage(null);
        case 1:
          return SearchPageFactory.buildPage(null);
        case 2:
          return ProfilePageFactory.buildPage(null);
        default:
          return HomePageFactory.buildPage(null);

      }
    }

    ;

    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(ImageAssets.fakeUser, width: 150, height: 150, fit: BoxFit.cover,),
              ),
              InkWell(
                onTap: (){
                  SharedPreferences.getInstance().then((value) => value.clear());
                  navigateToOnbroading();
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
              InkWell(
                onTap: (){
                  SharedPreferences.getInstance().then((value) => value.setBool("auth", false));
                  navigateToSingIn();
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
      ),
      bottomNavigationBar: BottomMenuView(viewModel: _mainBottomMenuViewModel),
      body: _buildBody(),
    );
  }
}
