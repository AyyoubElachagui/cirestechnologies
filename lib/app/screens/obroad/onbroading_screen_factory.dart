import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/screens/obroad/onbroading_screen.dart';
import 'package:cirestechnologies/app/screens/obroad/onbroading_screen_view_model.dart';
import 'package:cirestechnologies/app/screens/obroad/widget/onbroading_widget.dart';
import 'package:cirestechnologies/app/style/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnbroadingScreenFactory {
  static Widget buildScreen(RouteSettings? settings) {
    MaterialPageRoute? pageRoute;
    return ChangeNotifierProvider<OnbroadingScreenViewModel>(
      create: (context) {
        return OnbroadingScreenViewModel(
          navigationService:
              Provider.of<NavigationService>(context, listen: false),
          onbordingDataList: [
            OnbroadingWidget(
              subTitle: "Create an account",
              title: "Connect with people around the world",
              imagePath: ImageAssets.onbroading_one,
              desc:"Discover restaurants by type of meal, See menus and photos for nearby restaurants and bookmark your favorite places on the go",
            ),
            OnbroadingWidget(
              subTitle: "Log in to your account",
              title: "Let's build connection with new peoples",
              imagePath: ImageAssets.onbroading_two,
              desc:"Best restaurants delivering to your doorstep, Browse menus and build your order in seconds",
            ),
            OnbroadingWidget(
              subTitle: "Log in to your account",
              title: "Feel the happiness",
              imagePath: ImageAssets.onbroading_three,
              desc:"Explore curated lists of top restaurants, cafes, pubs, and bars in Mumbai, based on trends.",
            ),
          ],
        );
      },
      child: Consumer<OnbroadingScreenViewModel>(
        builder: (context, model, child) => OnbroadingScreens(
          viewModel: model,
          onbordingDataList: [
            OnbroadingWidget(
              subTitle: "Create an account",
              title: "Connect with people around the world",
              imagePath: ImageAssets.onbroading_one,
              desc:"Discover restaurants by type of meal, See menus and photos for nearby restaurants and bookmark your favorite places on the go",
            ),
            OnbroadingWidget(
              subTitle: "Log in to your account",
              title: "Let's build connection with new peoples",
              imagePath: ImageAssets.onbroading_two,
              desc:"Best restaurants delivering to your doorstep, Browse menus and build your order in seconds",
            ),
            OnbroadingWidget(
              subTitle: "Log in to your account",
              title: "Feel the happiness",
              imagePath: ImageAssets.onbroading_three,
              desc:"Explore curated lists of top restaurants, cafes, pubs, and bars in Mumbai, based on trends.",
            ),
          ],
        ),
      ),
    );
  }
}
