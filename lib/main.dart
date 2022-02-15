import 'package:cirestechnologies/app/app.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/screens/bottom_menu/bottom_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final navigationService = NavigationService();

  final GlobalKey<ScaffoldState> key = GlobalKey();

  final bottomMenuViewModel = BottomMenuViewModel(
    navigationService: navigationService,
    currentIndex: 0
  );



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: bottomMenuViewModel),
        Provider.value(value: key),
        Provider.value(value: navigationService),
      ],
      child: MyApp(),
    ),
  );
}