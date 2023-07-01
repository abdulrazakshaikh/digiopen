import 'package:flutter/cupertino.dart';
import 'package:xceednet/model/invoice_repository.dart';

class InvoiceViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<Map>? invoiceListData;
  String incoiceCount = "0";
  Map? invoiceDetail;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> getInvoiceListData(
      {String search = "", String nextIndex = "0"}) async {
    try {
      _isLoading = true;
      notifyListeners();
      invoiceListData = [];
      var _userdata = await new InvoiceRepository().getInvoiceListData({
        "start": nextIndex,
        "search": {"value": search},
        "length": "10"
      });
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
}
