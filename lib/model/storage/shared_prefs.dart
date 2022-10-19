import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/userdata.dart';
import '../../ui/login/login.dart';

class SharedPrefs extends ChangeNotifier {
  static late SharedPreferences _sharedPrefs;
  final keyUserData = "UserData";
  final keyIsLogin = "IsLogin";
  final keySelectedClientCode = "SelectedClientCode";
  final keySelectedUserId = "SelectedUserId";
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  UserData? get userdata {
    String uD = _sharedPrefs.getString(keyUserData) ?? "";
    if (uD == "null" || uD.isEmpty) {
      return null;
    } else {
      return UserData.fromJson(json.decode(uD));
    }
  }

  set userdata(UserData? value) {
    _sharedPrefs.setString(keyUserData, json.encode(value));
  }

  set isLogin(bool value) {
    _sharedPrefs.setBool(keyIsLogin, value);
  }

  bool get isLogin => _sharedPrefs.getBool(keyIsLogin) ?? false;


  void logout() {
    SharedPrefs().isLogin = false;
    //SharedPrefs().userdata = null;
    SharedPrefs().userdata = null;
    //  Navigator.pop(navigatorKey.currentContext);
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
      (Route<dynamic> route) => false,
    );
  }
}
