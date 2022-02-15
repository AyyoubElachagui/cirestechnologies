import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/routing/routes.dart';
import 'package:cirestechnologies/app/utils/toast_widget.dart';
import 'package:cirestechnologies/data/model/news_model.dart';
import 'package:cirestechnologies/data/repository/news_repository.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SearchPageViewModel({
    required this.navigationService,
  });

  final TextEditingController filter = TextEditingController();

  List<String> category = [
    "Science",
    "Business",
    "Sports",
    "Technology",
    "Startup",
    "Automobile",
  ];

  int indexCatSelected = 0;
  DateTime selectedDate = DateTime.now();


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (BuildContext? context, Widget? child){
        return Theme(
          data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primaryColorDark: AppColors.primary,
          )
          ), child: child!,
        );
      },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
        selectedDate = picked;
    notifyListeners();
  }


  final newsRepository = NewsRepository();
  final ToastUtils toastUtils = ToastUtils();
  List<NewsModel> listNews = [];


  Future getListNewsStartUp({required BuildContext context}) async {
    listNews.clear();
    final data = await newsRepository.getNewsStartUp();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNews = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsScience({required BuildContext context}) async {
    final data = await newsRepository.getNewsScience();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNews = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsTechnology({required BuildContext context}) async {
    listNews.clear();
    final data = await newsRepository.getNewsTechnology();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNews = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }


  Future getListNewsSports({required BuildContext context}) async {
    listNews.clear();
    final data = await newsRepository.getNewsSports();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNews = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsBusiness({required BuildContext context}) async {
    listNews.clear();
    final data = await newsRepository.getNewsBusiness();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNews = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  Future getListNewsAutomobile({required BuildContext context}) async {
    listNews.clear();
    final data = await newsRepository.getNewsAutomobile();
    if(data["success"] == true){
      List<dynamic> data1 = data["data"];
      listNews = data1.map((e) => NewsModel.fromJson(e)).toList();
      notifyListeners();
      return;
    }else{
      toastUtils.launchToast(context: context, title: "Error loading data", icon: Icons.block_outlined, backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  void filterList({required String dateComp}){
    listNews.sort((a,b) => a.date!.split(",")[0].compareTo(dateComp));
    notifyListeners();
  }

  void categorySelected({required BuildContext context, required int index}){
    switch(index){
      case 0: getListNewsScience(context: context);
      break;
      case 1: getListNewsBusiness(context: context);
      break;
      case 2: getListNewsSports(context: context);
      break;
      case 4: getListNewsTechnology(context: context);
      break;
      case 5: getListNewsStartUp(context: context);
      break;
      case 6: getListNewsAutomobile(context: context);
      break;
      default: getListNewsScience(context: context);
      break;
    }
    index != null ? indexCatSelected = index : indexCatSelected = 0;
    notifyListeners();
  }

  void navigateToNewsDetail({required NewsModel model, required String titleCategory}){
    navigationService.navigateTo(routeName: Routes.newsDetail, data: [titleCategory,model]);
  }

  void filterByAuthor(String v){
    listNews = listNews.where((e) => e.author!.toLowerCase() == v.toLowerCase()).toList();
    notifyListeners();
  }






  void navigateToHomePage() {
    navigationService.navigateToAndMakeRoot(routeName: Routes.onbroadingScreen);
  }
}
