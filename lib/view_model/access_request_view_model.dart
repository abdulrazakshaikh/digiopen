import 'package:flutter/cupertino.dart';

import '../model/access_request_repository.dart';

class AccessRequestViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<Map>? accessRequestListData;
  Map? accessRequestDetail;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> getAccessRequestListData(
      {String search = "",
      String nextIndex = "0",
      String subscriber_id = "0"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      accessRequestListData = [];
      var map = {
        "start": nextIndex,
        "search": {"value": search},
        "length": "10"
      };
      if (subscriber_id != null && subscriber_id != "0") {
        map['subscriber_id'] = subscriber_id;
      }
      var _userdata =
          await new AccessRequestRepository().getAccessRequestListData(map);
      accessRequestListData = [];

      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        Map keys = _userdata.data['columns'];
        List dataa = _userdata.data['data'] as List;
        dataa.forEach((element) {
          Map item = {};
          int i = 0;
          keys.forEach((value, v) {
            item[value] = element[i];
            i++;
          });
          accessRequestListData!.add(item);
        });
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

  Future<bool> getDeleteAllAccessRequestListData(
      {String subscriber_id = "0"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      var map = {};
      if (subscriber_id != null && subscriber_id != "0") {
        map['subscriber_id'] = subscriber_id;
      }
      var _userdata = await new AccessRequestRepository()
          .getDeleteAllAccessRequestListData(map);
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("getDeleteAllAccessRequestListData");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

/* Future<bool> getAccessRequestDetailData({required String accessRequestId}) async {
    try {
      _isLoading = true;
      notifyListeners();
      accessRequestListData = [];
      var _userdata =
          await new AccessRequestRepository().getAccessRequestDetailData("${accessRequestId}");
      accessRequestDetail = {};
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        accessRequestDetail = _userdata.data['data'];
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
  }*/
}
