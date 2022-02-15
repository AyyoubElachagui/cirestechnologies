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
  List<NewsModel> listNewsScience = [];
  List<NewsModel> listNewsAutoMobile = [];
  List<NewsModel> listNewsSport = [];
  List<NewsModel> listNewsTechnology = [];
  List<NewsModel> listNewsBusiness = [];


  Future getListNewsStartUp({required BuildContext context}) async {
    final data = await newsRepository.getNewsStartUp();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsStarUp = data1.map((e) => NewsModel.fromJson(e)).toList();
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsScience({required BuildContext context}) async {
    final data = await newsRepository.getNewsScience();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsScience = data1.map((e) => NewsModel.fromJson(e)).toList();
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsTechnology({required BuildContext context}) async {
    final data = await newsRepository.getNewsTechnology();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsTechnology = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }


  Future getListNewsSports({required BuildContext context}) async {
    final data = await newsRepository.getNewsSports();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsSport = data1.map((e) => NewsModel.fromJson(e)).toList();
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsBusiness({required BuildContext context}) async {
    final data = await newsRepository.getNewsBusiness();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsBusiness = data1.map((e) => NewsModel.fromJson(e)).toList();
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsAutomobile({required BuildContext context}) async {
    final data = await newsRepository.getNewsAutomobile();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNewsAutoMobile = data1.map((e) => NewsModel.fromJson(e)).toList();
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  void navigateToNewsDetail({required NewsModel model}){
    navigationService.navigateTo(routeName: Routes.newsDetail, data: model);
  }

  void navigateToOnbroadingPage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
