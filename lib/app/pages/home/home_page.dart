import 'package:cirestechnologies/app/pages/home/home_page_view_model.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final HomePageViewModel viewModel;

  HomePage({required this.viewModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Text("hhhhhhhhhhhhhhhhhh welcome to home page"),
        )
      ),
    );
  }
}
