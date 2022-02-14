import 'package:cirestechnologies/app/screens/obroad/onbroading_screen_view_model.dart';
import 'package:cirestechnologies/app/screens/obroad/widget/onbroading_widget.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class OnbroadingScreens extends StatefulWidget {
  final List<OnbroadingWidget> onbordingDataList;
  final OnbroadingScreenViewModel viewModel;

  OnbroadingScreens({required this.onbordingDataList, required this.viewModel});

  @override
  _OnbroadingScreensState createState() => _OnbroadingScreensState();
}

class _OnbroadingScreensState extends State<OnbroadingScreens> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 8.0 : 4.0,
      width: page == currentPage ? 8.0 : 4.0,
      decoration: BoxDecoration(
        color: page == currentPage
            ? AppColors.gray
            : AppColors.gray.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Expanded(
            flex: 8,
            child: new PageView(
              children: widget.onbordingDataList,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPageIndicator(0),
                  _buildPageIndicator(1),
                  _buildPageIndicator(2),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: lastPage
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                lastPage
                    ? Container()
                    : TextButton(
                        child: Text(
                          lastPage ? "" : "SKIP",
                          style: TextStyle(
                              color: AppColors.gray,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        onPressed: () => lastPage
                            ? null
                            : widget.viewModel.navigateToSingInPage()),
                lastPage
                    ? ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                AppColors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ))),
                        onPressed: () {
                          widget.viewModel.navigateToSingInPage();
                        },
                        child: Text("GET STARTED"),
                      )
                    : TextButton(
                        child: Text("NEXT",
                            style: TextStyle(
                                color: AppColors.gray,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0)),
                        onPressed: () => lastPage
                            ? widget.viewModel.navigateToSingInPage()
                            : controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
