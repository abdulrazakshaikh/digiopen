import 'package:flutter/cupertino.dart';

import '../model/package_repository.dart';

class PackageViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List? packageListData;
  Map? packageDetail;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> getPackageListData(
      {String search = "", String nextIndex = "0"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      packageListData = [];
      var _userdata = await new PackageRepository().getPackageListData({
        /*"start": nextIndex,
        "search": {"value": search},
        "length": "10"*/
      });
      packageListData = [];
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        // List dataa = _userdata.data['data'];
        packageListData = _userdata.data['data'];
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("getPackageListData");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getPackageDetailData({@required String packageId = ""}) async {
    try {
      _isLoading = true;
      notifyListeners();
      packageDetail = null;
      var _userdata =
          await new PackageRepository().getPackageDetailData("${packageId}");
      packageDetail = {};
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        packageDetail = _userdata.data['data'];
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("getPackageDetailData");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
