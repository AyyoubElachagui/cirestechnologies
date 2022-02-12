import 'package:cirestechnologies/app/app.dart';
import 'package:cirestechnologies/app/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final navigationService = NavigationService();

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: navigationService),
      ],
      child: MyApp(),
    ),
  );
}