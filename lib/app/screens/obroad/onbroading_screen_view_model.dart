import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/screens/obroad/widget/onbroading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbroadingScreenViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  final List<OnbroadingWidget> onbordingDataList;

  OnbroadingScreenViewModel({
    required this.navigationService,
    required this.onbordingDataList
  });


  void navigateToSingInPage() async{
    await SharedPreferences.getInstance().then((prefValue) {
      prefValue.setBool("onbroading", true);
    });
    navigationService.navigateToAndMakeRoot(routeName: Routes.singIn);
  }
}
