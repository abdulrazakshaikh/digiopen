import 'package:flutter/cupertino.dart';
import 'package:xceednet/data/user_location_access.dart';

import '../data/userdata.dart';
import '../model/auth_repository.dart';
import '../model/storage/shared_prefs.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<UserLocationAccess> userlocationAccess = [];
  List<dynamic> userList = [];

  Future<bool> userLogin(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getUserLogin({
        "email": "$username",
        "password": "$password",
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        //  var data = _userdata.data as List;
        SharedPrefs().authToken = _userdata.data['auth_token'];
        SharedPrefs().email = username;
        userDetails();
        //SharedPrefs().isLogin = true;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> userDetails() async {
    try {
      print("aassasasasa");
      var _userdata = await new AuthRepository().getUserLoginDetail(map: {});
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        //  var data = _userdata.data as List;
        var where = (_userdata.data['data'] as List)
            .where((element) => element['email'] == SharedPrefs().email)
            .toList();
        UserData userData = UserData.fromJson(where[0]);
        SharedPrefs().userdata = userData;
        return true;
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      _error = e.toString();
      return false;
    }
  }

  Future<bool> getAllUserDetail() async {
    try {
      var _userdata = await new AuthRepository().getUserLoginDetail(map: {});
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        //  var data = _userdata.data as List;
        userList = _userdata.data['data'] as List;
        return true;
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      _error = e.toString();
      return false;
    }
  }

  Future<bool> getUserLocationAccess() async {
    try {
      userlocationAccess = [];
      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getUserLocationAccess({});
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data['data'] as List;

        data.forEach((element) {
          userlocationAccess.add(UserLocationAccess.fromJson(element));
        });
        // SharedPrefs().authToken=_userdata.data['auth_token'];
        //SharedPrefs().isLogin = true;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
