import 'package:cirestechnologies/app/routing/app_router.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acaps',
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      home: AppRouter.buildSplashPage(),
    );
  }
}
