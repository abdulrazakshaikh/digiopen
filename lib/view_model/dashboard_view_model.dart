import 'package:flutter/cupertino.dart';
import 'package:xceednet/data/user_location_access.dart';

import '../data/dashboarddata.dart';
import '../data/userdata.dart';
import '../model/auth_repository.dart';
import '../model/dashboard_repository.dart';
import '../model/storage/shared_prefs.dart';

class DashboardViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  late DashboardData dashboardData;
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
        dashboardData = DashboardData.fromJson(_userdata.data);
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
