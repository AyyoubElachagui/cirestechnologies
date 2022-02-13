import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/utils/toast_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:cirestechnologies/data/repository/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  HomePageViewModel({
    required this.navigationService,
  });

  final newsRepository = NewsRepository();
  final ToastUtils toastUtils = ToastUtils();
  List<NewsModel> listNewsStarUp = [];

  void getListNewsStartUp({required BuildContext context}) async {
    final data = await newsRepository.getNewsStartUp();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsStarUp = data1.map((e) => NewsModel.fromJson(e)).toList();
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  void navigateToNewsDetail({required NewsModel model}){
    navigationService.navigateTo(routeName: Routes.newsDetail, data: model);
  }

  void navigateToHomePage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
