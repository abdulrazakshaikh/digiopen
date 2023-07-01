import 'package:flutter/cupertino.dart';

import '../model/package_repository.dart';

class PackageViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List? packageListData;
  Map? packageDetail;
  String incoiceCount = "0";

  bool _isUpdateLoading = false;

  String? get error {
    return _error;
  }

  bool get isUpdateLoading {
    return _isUpdateLoading;
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
        incoiceCount = packageListData!.length.toString();

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

  Future<bool> addPackage(Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isLoading = true;
      notifyListeners();
      packageDetail = {};
      var _userdata = await new PackageRepository()
          .addPackageDetailData({"location_package": map});
      print(_userdata);
      _isLoading = false;
      notifyListeners();
      if (_userdata.isSuccess) {
        return true;
      } else {
        _error = _userdata.message;
        return false;
      }
    } catch (e) {
      print("addSubscriber");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updatePackage(String subscriberId, Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isUpdateLoading = true;
      notifyListeners();
      var _userdata = await new PackageRepository()
          .updatePackageDetailData(subscriberId, {"location_package": map});
      _isUpdateLoading = false;
      notifyListeners();
      if (_userdata.isSuccess) {
        return true;
      } else {
        _error = _userdata.message;
        return false;
      }
    } catch (e) {
      print("updateSubscriber");
      print(e);
      _isUpdateLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deletePackage(String subscriberId, Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isUpdateLoading = true;
      notifyListeners();
      var _userdata = await new PackageRepository()
          .deletePackageDetailData(subscriberId, {"location_package": map});
      _isUpdateLoading = false;
      notifyListeners();
      if (_userdata.isSuccess) {
        return true;
      } else {
        _error = _userdata.message;
        return false;
      }
    } catch (e) {
      print("updateSubscriber");
      print(e);
      _isUpdateLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
