import 'package:flutter/material.dart';

import 'c_academy_data.dart';
import 'c_user.dart';

class MyService {

  static final MyService _instance = MyService._internal();

  // passes the instantiation to the _instance object
  factory MyService() => _instance;

  //initialize variables in here
  MyService._internal() {

    String email = "";
    String name = "";
    List<String> favorited = [];
    Map reserve = Map();

    _user = CustomUser(email, name, favorited, reserve);
  }

  late CustomUser _user;
  late String _academy;
  late int _authority;
  late int _room;
  late Map _reserveList;

  //short getter for my variable
  CustomUser get user => _user;
  String get academy => _academy;
  int get authority => _authority;
  int get room => _room;
  Map get reserve => _reserveList;

  //short setter for my variable
  set curUser(CustomUser value) => _user = value;
  set curAcademy(String value) => _academy = value;
  set curAuthority(int value) => _authority = value;
  set curRoom(int value) => _room = value;
  set curReserve(Map value) => _reserveList = value;

  void navigatorPush(BuildContext context, dynamic dst) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => dst,
        ),
      );
  }

  void navigatorPushReplacement(BuildContext context, dynamic dst) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => dst,
      ),
    );
  }

  void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  String getDateString(DateTime date) {
    String dateString = "";

    int hour = date.day >= 13 ? date.day - 12 : date.day;

    dateString += date.year.toString() + "년 ";
    dateString += date.month.toString() + "월 ";
    dateString += date.day.toString() + "일 ";
    dateString += (date.day>=13 ? "오후 " : "오전 ") + hour.toString() + "시 ";
    dateString += date.minute.toString() + "분";

    return dateString;
  }

  // void printUserData(){
  //   print(User.email);
  //   print(User.name);
  //   print(User.favorited);
  //   print(User.reserve);
  // }

}

String convertDateToString(DateTime time) {

  String res = "";

  res += time.year.toString();
  res += time.month < 10 ? "0${time.month}" : "${time.month}";
  res += time.day < 10 ? "0${time.day}" : "${time.day}";
  res += time.hour < 10 ? "0${time.hour}00" : "${time.hour}00";
  res += time.second < 10 ? "_00${time.second}" : "_${time.second}";

  return res;
}

void createSnackBar(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);

  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
      duration: const Duration(seconds: 1),
    ),
  );
}

DateTime convertStringToDate(String time) {

  DateTime res = DateTime(2022,06,01);

  return res;
}

// void showToast(String msg) {
//   Fluttertoast.showToast(
//     msg: msg,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.black,
//     fontSize: 16,
//     textColor: Colors.white,
//     toastLength: Toast.LENGTH_LONG,
//   );
// }

bool checkReserveCount(DateTime _time) {

  List<String> timeList = [];

  for(var item in service.reserve.keys) {
    if(service.reserve[item].toString().compareTo(service.user.name) == 0) {
      timeList.add(item.toString().substring(0,8));
    }
  }

  String compareTime = convertDateToString(_time);
  compareTime = compareTime.substring(0,8);
  int _count = 0;

  for(var item in timeList) {
    if(item.compareTo(compareTime) == 0)
      ++_count;
  }

  return _count < 2;
}

MyService service = MyService();