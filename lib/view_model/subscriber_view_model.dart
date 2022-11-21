import 'package:flutter/cupertino.dart';

import '../model/subscriber_repository.dart';

class SubscriberViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<Map>? subscriberData;
  Map? subscriberDetail;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> getSubscriberListData(
      {String search = "", String nextIndex = "0"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      subscriberData = [];
      var _userdata = await new SubscriberRepository().getSubscriberListData({
        "start": nextIndex,
        "search": {"value": search},
        "length": "10"
      });
      subscriberData = [];

      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        Map keys = _userdata.data['columns'];
        List dataa = _userdata.data['data'];
        dataa.forEach((element) {
          Map item = {};
          int i = 0;
          keys.forEach((key, value) {
            item[key] = element[i];
            i++;
          });
          subscriberData!.add(item);
        });
        _isLoading = false;
        // SharedPrefs().authToken=_userdata.data['auth_token'];
        //SharedPrefs().isLogin = true;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("getSubscriberListData");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getSubscriberDetailData({String subscriberId = ""}) async {
    try {
      _isLoading = true;
      notifyListeners();
      subscriberData = [];
      var _userdata = await new SubscriberRepository()
          .getSubscriberDetailData("${subscriberId}");
      subscriberDetail = {};
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        subscriberDetail = _userdata.data['data'];
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("getSubscriberListData");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
