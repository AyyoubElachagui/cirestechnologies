import 'package:cirestechnologies/app/sreens/obroad/onbroadingScreenData.dart';
import 'package:flutter/material.dart';


class IntroductionScreen extends StatefulWidget {
  final List<OnbroadingSreenData> onbordingDataList;
  final MaterialPageRoute pageRoute;

  IntroductionScreen({required this.onbordingDataList, required this.pageRoute});

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }


  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
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
        color: page == currentPage ? Colors.grey : Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: new Color(0xFFFFFFFF),
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
          new Expanded(
            flex: 7,
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
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: lastPage ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                lastPage ? Container() : TextButton(
                  child: new Text(lastPage ? "" : "SKIP",
                      style: new TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? null
                      : widget.skipPage(
                    context,
                  ),
                ),
                lastPage ? ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                          )
                      )
                  ),
                  onPressed: (){

                  },
                  child: Text("GET STARTED"),
                ) : TextButton(
                  child: new Text("NEXT",
                      style: new TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? widget.skipPage(context)
                      : controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                )
                ,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
