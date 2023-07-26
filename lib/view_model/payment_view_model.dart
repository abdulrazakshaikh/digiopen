import 'package:flutter/cupertino.dart';
import 'package:xceednet/model/payment_repository.dart';

class PaymentViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<Map>? paymentListData;
  Map? paymentDetail;
  String incoiceCount = "0";

  bool _isUpdateLoading = false;

  bool get isUpdateLoading {
    return _isUpdateLoading;
  }

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<Map<String, dynamic>>? columnsData;

  Future<bool> getPaymentListData(
      {String search = "",
      String nextIndex = "0",
      String? columIndex = "",
      String perPage = "10",
      List<String>? filter}) async {
    try {
      _isLoading = true;
      notifyListeners();
      paymentListData = [];
      Map sFilter = {};
      var map;
      if (filter != null && filter.length > 0) {
        String sfilter = filter.join('|');
        sFilter = {
          "9": {
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
      var _userdata = await new PaymentRepository().getPaymentListData(map);
      paymentListData = [];

      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        // Map keys1 = _userdata.data['columns'];
        List keys = _userdata.data['columns'];
        columnsData = [];
        columnsData?.add({
          "subscriber_payments.status".toString(): {
            "select_options": [
              ["Open", "open"],
              ["Canceled", "canceled"],
              ["Reopened", "reopened"],
              ["Closed", "closed"]
            ]
          }
        });

        List dataa = _userdata.data['data'] as List;
        incoiceCount = _userdata.data['recordsFiltered'].toString();
        dataa.forEach((element) {
          Map item = {};
          int i = 0;
          keys.forEach((value) {
            item[value] = element[i];
            i++;
          });
          paymentListData!.add(item);
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

  Future<bool> getPaymentDetailData({required String invoiceId}) async {
    try {
      _isLoading = true;
      notifyListeners();
      paymentListData = [];
      var _userdata =
          await new PaymentRepository().getPaymentDetailData("${invoiceId}");
      paymentDetail = {};
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        paymentDetail = _userdata.data['data'];
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
      paymentListData = [];
      var _userdata = await new PaymentRepository()
          .addPaymentDetailData({"subscriber_payment": map});
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
      var _userdata = await new PaymentRepository()
          .updatePaymentDetailData(subscriberId, {"subscriber_payment": map});
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
