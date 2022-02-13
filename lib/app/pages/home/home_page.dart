import 'package:cirestechnologies/app/pages/home/home_page_view_model.dart';
import 'package:cirestechnologies/app/style/app_colors.dart';
import 'package:cirestechnologies/app/widgets/bottom_menu/bottom_menu_view_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';



class HomePage extends StatefulWidget {
  final HomePageViewModel viewModel;

  HomePage({required this.viewModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.viewModel.getListNewsStartUp(context: context);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.viewModel.listNewsStarUp);
    return Scaffold(
      bottomNavigationBar: BottomMenuViewFactory(),
      body: widget.viewModel.listNewsStarUp.isEmpty == false ? Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 90),
                Center(
                  child: Text("hhhhhhhhhhhhhhhhhh welcome to home page"),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  child: Row(
                    children: [
                      ...widget.viewModel.listNewsStarUp.map((e) {
                        ///.parse(e.date!
                        String firstDate = e.date!.split(",")[0];
                        String day = firstDate.split(' ')[0];
                        String monthName = firstDate.split(' ')[1];
                        int month = 0;
                        switch(monthName){
                          case "Jan" : month = 1;
                          break;
                          case "Feb" : month = 2;
                          break;
                          case "Mar" : month = 3;
                          break;
                          case "Apr" : month = 4;
                          break;
                          case "May" : month = 5;
                          break;
                          case "Jun" : month = 6;
                          break;
                          case "Jul" : month = 7;
                          break;
                          case "Aug" : month = 8;
                          break;
                          case "Sep" : month = 9;
                          break;
                          case "Oct" : month = 10;
                          break;
                          case "Nov" : month = 11;
                          break;
                          case "Dec" : month = 12;
                          break;
                        }
                        String year = firstDate.split(' ')[2];
                        var date = Jiffy(year+"-"+month.toString()+"-"+day).format("yyyy-MM-dd");
                        var dateString = Jiffy(date, "yyyy-MM-dd").startOf(Units.DAY).fromNow().toString();
                        return InkWell(
                          onTap: (){
                            widget.viewModel.navigateToNewsDetail(model: e);
                          },
                          child: Container(
                            width: 210,
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(e.imageUrl!, width: 210, height: 100, fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    e.title!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13
                                    )
                                ),
                                SizedBox(height: 5,),
                                Text(
                                    dateString,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: AppColors.gray.withOpacity(0.5)
                                    )
                                ),
                                SizedBox(height: 5,),
                                Text(
                                    "by "+e.author!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: AppColors.gray.withOpacity(0.5)
                                    )
                                ),


                                /*InkWell(
                                onTap: (){
                                  widget.viewModel.navigateToNewsDetail(model: e);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.author ?? ""),
                                    Text(e.time ?? ""),
                                  ],
                                ),
                              ),*/
                                SizedBox(width: 20,)
                              ],
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )  : Container(child: Center(child: CircularProgressIndicator(color: AppColors.primary, strokeWidth: 1,),),),
    );
  }
}
