import 'package:flutter/cupertino.dart';

import '../model/dashboard_repository.dart';

class DashboardViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  late Map dashboardData;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> getDashboardData() async {
    try {
      _isLoading = true;
      notifyListeners();
      var _userdata = await new DashboardRepository().getDashboardData({
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        dashboardData = _userdata.data;
        print('sss');
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
