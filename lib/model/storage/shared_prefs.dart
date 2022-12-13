import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xceednet/data/user_location_access.dart';

import '../../data/userdata.dart';
import '../../ui/login/login.dart';

class SharedPrefs extends ChangeNotifier {
  static late SharedPreferences _sharedPrefs;
  final keyUserData = "UserData";
  final keySelectedUserLocation = "SelectedUserLocation";
  final keyAuthToken = "AuthToken";
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
  UserLocationAccess? get selectedUserLocation {
    String uD = _sharedPrefs.getString(keySelectedUserLocation) ?? "";
    if (uD == "null" || uD.isEmpty) {
      return null;
    } else {
      return UserLocationAccess.fromJson(json.decode(uD));
    }
  }

  set selectedUserLocation(UserLocationAccess? value) {
    _sharedPrefs.setString(keySelectedUserLocation, json.encode(value));
  }

  set isLogin(bool value) {
    _sharedPrefs.setBool(keyIsLogin, value);
  }

  bool get isLogin => _sharedPrefs.getBool(keyIsLogin) ?? false;

  set authToken(String value) {
    _sharedPrefs.setString(keyAuthToken, value);
  }

  String? get authTokenn {
    return _sharedPrefs.getString(keyAuthToken);
  }

  set email(String? value) {
    _sharedPrefs.setString(keySelectedUserId, value ?? "");
  }

  String? get email {
    return _sharedPrefs.getString(keySelectedUserId);
  }

  void logout() {
    SharedPrefs().isLogin = false;
    SharedPrefs().selectedUserLocation = null;
    SharedPrefs().userdata = null;
    SharedPrefs().authToken = "";
    //  Navigator.pop(navigatorKey.currentContext);
    Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
      (Route<dynamic> route) => false,
    );
  }
}
