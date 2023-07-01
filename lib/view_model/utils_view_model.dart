import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UtilsViewModel extends ChangeNotifier {
  Map? addressDetail = null;
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> getAddressViaPin(String pinCode) async {
    _isLoading = true;
    notifyListeners();
    var url = Uri.parse("https://api.postalpincode.in/pincode/$pinCode");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    try {
      _isLoading = false;
      notifyListeners();
      if (json.decode(response.body)[0]['Status']!.toString() != "Error") {
        addressDetail = json.decode(response.body)[0]['PostOffice'][0];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e);
      return false;
    }
  }
}
