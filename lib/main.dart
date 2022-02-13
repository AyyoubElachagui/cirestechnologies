import 'package:cirestechnologies/app/app.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final navigationService = NavigationService();

  final bottomMenuViewModel = BottomMenuViewModel(
    navigationService: navigationService,
    currentIndex: 0
  );



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: bottomMenuViewModel),
        Provider.value(value: navigationService),
      ],
      child: MyApp(),
    ),
  );
}