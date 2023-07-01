import 'package:flutter/cupertino.dart';

import '../model/subscriber_repository.dart';

class SubscriberViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isUpdateLoading = false;
  String? _error;
  List<Map>? subscriberData;
  List<Map<String, dynamic>>? columnsData;
  List<dynamic>? userData;
  Map? subscriberDetail;
  Map? apiCompleteResult;
  String incoiceCount = "0";

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  bool get isUpdateLoading {
    return _isUpdateLoading;
  }

  Future<bool> getSubscriberListData(
      {String search = "",
      String nextIndex = "0",
      String perPage = "10",
      String? columIndex = "",
      List<String>? filter}) async {
    try {
      _isLoading = true;
      notifyListeners();
      subscriberData = [];
      Map sFilter = {};
      var map;
      if (filter != null && filter.length > 0) {
        String sfilter = filter.join('|');
        sFilter = {
          "$columIndex": {
            "search": {"value": "$sfilter"}
          }
        };
        map = {
          "start": nextIndex,
          "search": {"value": search},
          "length": "$perPage",
          "columns": sFilter
        };
      } else {
        map = {
          "start": nextIndex,
          "search": {"value": search},
          "length": "$perPage",
        };
      }

      var _userdata =
          await new SubscriberRepository().getSubscriberListData(map);
      subscriberData = [];
      apiCompleteResult = _userdata.data;
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        Map keys = _userdata.data['columns'];
        columnsData = [];
        keys.forEach((key, value) {
          columnsData?.add({key.toString(): value});
        });
        incoiceCount = _userdata.data['recordsTotal'].toString();

        //columnsData=List.from(keys.map((key, value) => {key,value}));
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

  Future<bool> getUserListData(
      {String search = "",
      String nextIndex = "0",
      String perPage = "10"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      userData = [];
      var _userdata = await new SubscriberRepository().getUserListData({});
      userData = [];
      print(_userdata.isSuccess);
      print(_userdata.data['data']);
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        userData = _userdata.data['data'];
        _isLoading = false;
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

  Future<bool> getOnlineSubscriberListData(
      {String search = "", String nextIndex = "0"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      subscriberData = [];
      var _userdata =
          await new SubscriberRepository().getOnlineSubscriberListData({
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
        incoiceCount = _userdata.data['recordsTotal'].toString();
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

  Future<bool> addSubscriber(Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isLoading = true;
      notifyListeners();
      subscriberData = [];
      var _userdata = await new SubscriberRepository()
          .addSubscriberDetailData({"subscriber": map});
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

  Future<bool> updateSubscriber(String subscriberId, Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isUpdateLoading = true;
      notifyListeners();
      var _userdata = await new SubscriberRepository()
          .updateSubscriberDetailData(subscriberId, {"subscriber": map});
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
