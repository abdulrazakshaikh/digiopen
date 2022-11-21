import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:xceednet/model/storage/shared_prefs.dart';

import '../apis/app_exception.dart';
import '../apis/new_api_response.dart';
import 'app_url.dart';
import 'base_service.dart';

class NetworkApiService extends BaseService {
  String baseUrl = AppUrl.baseUrl;

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future get(String url, {data}) async {
    if (!await checkInternetConnection()) {
      return NewAPIResponse(
          status: "FAILURE", message: "No internet connection! ", data: null);
    }
    dynamic responseJson;

    try {
      var header = {
        "content-type": "application/json",
        "accept": "application/json"
      };
      if (SharedPrefs().authTokenn != null &&
          SharedPrefs().authTokenn!.isNotEmpty) {
        header['Authentication'] = SharedPrefs().authTokenn!;
      }
      var newBaseUrl;
      if (url == AppUrl.listOfLocation) {
        newBaseUrl = AppUrl.baseUrl;
      } else {
        var keySelectedUserLocation2 = SharedPrefs().selectedUserLocation;
        newBaseUrl = "https://" +
            keySelectedUserLocation2!.subdomain! +
            "." +
            keySelectedUserLocation2!.domain! +
            "/";
      }
      var parse = Uri.parse(newBaseUrl + url);
      print("dsvv");
      AppUrl.debugPrint("*********API Call Started************");
      AppUrl.debugPrint("API Request Type:GET");
      AppUrl.debugPrint("API Call URL :" + parse.toString());
      AppUrl.debugPrint("API Header :" + header.toString());
      final response = await http.get(parse, headers: header);
      AppUrl.debugPrint(
          " Response  Status : " + response.statusCode.toString());
      AppUrl.debugPrint("Response  Body: " + response.body);
      responseJson = returnResponse(response);
      // AppUrl.debugPrint("Dencrypted Response  : " + responseJson);
      AppUrl.debugPrint("*********API Call End************");
      return responseJson;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future post(String url, data) async {
    if (!await checkInternetConnection()) {
      return NewAPIResponse(
          status: "FAILURE", message: "No internet connection! ", data: {});
    }
    dynamic responseJson;
    try {
      var header = {
        "content-type": "application/json",
        "accept": "application/json"
      };

      var newBaseUrl;
      if (url == AppUrl.login) {
        newBaseUrl = AppUrl.baseUrl;
      } else {
        var keySelectedUserLocation2 = SharedPrefs().selectedUserLocation;
        newBaseUrl = "https://" +
            keySelectedUserLocation2!.subdomain! +
            "." +
            keySelectedUserLocation2!.domain! +
            "/";
        if (SharedPrefs().authTokenn != null &&
            SharedPrefs().authTokenn!.isNotEmpty) {
          header['Authentication'] = SharedPrefs().authTokenn!;
        }
      }
      var parse = Uri.parse(newBaseUrl + url);
      AppUrl.debugPrint("*********API Call Started************");
      AppUrl.debugPrint("API Request Type:POST");
      AppUrl.debugPrint("API Call URL :" + parse.toString());
      AppUrl.debugPrint("API Header :" + header.toString());
      AppUrl.debugPrint("Request Data : " + data.toString());
      AppUrl.debugPrint("Request Data : " + json.encode(data).toString());
      final response =
          await http.post(parse, body: json.encode(data), headers: header);
      AppUrl.debugPrint(
          " Response  Status : " + response.statusCode.toString());
      AppUrl.debugPrint("Response  Body: " + response.body);
      responseJson = returnResponse(response);
      // AppUrl.debugPrint("Dencrypted Response  : " + responseJson);
      AppUrl.debugPrint("*********API Call End************");
      return responseJson;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future put(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(baseUrl + url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future delete(String url, data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response,
      {bool decryptRequired = true}) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return NewAPIResponse.fromJson(responseJson);
      case 400:
        //throw BadRequestException(response.body.toString());
        return NewAPIResponse(
            status: "FAILURE", message: "Invalid Request: ", data: null);
      case 401:
      case 404:
      case 403:
        //throw UnauthorisedException(response.body.toString());
        {
          dynamic responseJson = jsonDecode(response.body);
          if (responseJson['error'] == null) {
            return NewAPIResponse(
                status: "FAILURE",
                message: "Unauthorised Request: ",
                data: null);
          } else {
            return NewAPIResponse(
                status: "FAILURE", message: responseJson['error'], data: null);
          }
        }
      case 500:
      default:
        //throw FetchDataException('Error occured while communication with server' + ' with status code : ${response.statusCode}');
        return NewAPIResponse(
            status: "FAILURE",
            message: 'Error occured while communication with server' +
                ' with status code : ${response.statusCode}',
            data: null);
    }
  }

  @override
  Future postMultiPart(String url, data, imagePath) async {
    if (!await checkInternetConnection()) {
      return NewAPIResponse(
          status: "FAILURE", message: "No internet connection! ", data: {});
    }
    dynamic responseJson;
    try {
      var header = {
        "content-type": "application/x-www-form-urlencoded",
        "accept": "application/json"
      };
      var parse = Uri.parse(baseUrl + url);
      AppUrl.debugPrint("*********API Call Started************");
      AppUrl.debugPrint("API Request Type:POST");
      AppUrl.debugPrint("API Call URL :" + parse.toString());
      AppUrl.debugPrint("API Header :" + header.toString());
      AppUrl.debugPrint("Request Data : " + data.toString());
      AppUrl.debugPrint("Request Data : " + json.encode(data).toString());
      var request = http.MultipartRequest('POST', parse);
      request.fields.addAll(data);
      request.headers.addAll(header);
      imagePath.forEach((key, value) {
        print(value);
        request.files.add(http.MultipartFile.fromBytes(
            key, File(value).readAsBytesSync(),
            filename: value.split("/").last));
      });

      var res = await request.send();

      var response = await http.Response.fromStream(res);
      AppUrl.debugPrint(
          " Response  Status : " + response.statusCode.toString());
      AppUrl.debugPrint("Response  Body: ${response.body}");
      responseJson = returnResponse(response);
      // AppUrl.debugPrint("Dencrypted Response  : " + responseJson);
      AppUrl.debugPrint("*********API Call End************");
      return responseJson;
    } catch (e) {
      print(e);
    }
  }
}
