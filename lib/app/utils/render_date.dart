import 'package:jiffy/jiffy.dart';

class RenderDate{
  final String date;

  RenderDate({required this.date});


  int renderMonthNumber({required String monthName}){
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
    return month;
  }

  String jiffyDate({required String monthName}){
    String firstDate = date.split(",")[0];
    String day = firstDate.split(' ')[0];
    int month = renderMonthNumber(monthName: monthName);
    String year = firstDate.split(' ')[2];
    var _date = Jiffy(year+"-"+month.toString()+"-"+day).format("yyyy-MM-dd");
    var dateString = Jiffy(_date, "yyyy-MM-dd").startOf(Units.DAY).fromNow().toString();
    return dateString;
  }

}