import 'package:flutter/cupertino.dart';
import 'package:xceednet/model/invoice_repository.dart';

class InvoiceViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<Map>? invoiceListData;
  String incoiceCount = "0";
  Map? invoiceDetail;
  List<Map<String, dynamic>>? columnsData;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  bool _isUpdateLoading = false;

  bool get isUpdateLoading {
    return _isUpdateLoading;
  }

  Future<bool> getInvoiceListData(
      {String search = "",
      String nextIndex = "0",
      String perPage = "10",
      String? columIndex = "",
      List<String>? filter}) async {
    try {
      _isLoading = true;
      notifyListeners();
      invoiceListData = [];
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
      var _userdata = await new InvoiceRepository().getInvoiceListData(map);
      invoiceListData = [];

      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        _isLoading = false;
        notifyListeners();
        return false;
      } else {
        Map keys = _userdata.data['columns'];
        List dataa = _userdata.data['data'];
        incoiceCount = _userdata.data['recordsTotal'].toString();
        columnsData = [];
        keys.forEach((key, value) {
          columnsData?.add({key.toString(): value});
        });
        dataa.forEach((element) {
          Map item = {};
          int i = 0;
          keys.forEach((key, value) {
            item[key] = element[i];
            i++;
          });
          invoiceListData!.add(item);
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

  Future<bool> getInvoiceDetailData({required String invoiceId}) async {
    try {
      _isLoading = true;
      notifyListeners();
      invoiceListData = [];
      var _userdata =
          await new InvoiceRepository().getInvoiceDetailData("${invoiceId}");
      invoiceDetail = {};
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        invoiceDetail = _userdata.data['data'];
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

  Future<bool> addInvoice(Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isLoading = true;
      notifyListeners();
      invoiceListData = [];
      var _userdata = await new InvoiceRepository()
          .addInvoiceDetailData({"subscriber_invoice": map});
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

  Future<bool> updateInvoice(String subscriberId, Map map) async {
    try {
      //map['status_event'] = 'create_new';
      _isUpdateLoading = true;
      notifyListeners();
      var _userdata = await new InvoiceRepository()
          .updateInvoiceDetailData(subscriberId, {"subscriber_invoice": map});
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
