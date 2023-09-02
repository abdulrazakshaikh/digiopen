import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/storage/shared_prefs.dart';

class AppUtils {
  static appToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        //textColor: Colors.white,
        fontSize: 16.0);
  }

  static String? validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static InputDecoration getTextForField(BuildContext context, String hint) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: '$hint'.toLowerCase(),
      hintStyle: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.bodyMedium,
          letterSpacing: 1.8,
          fontWeight: FontWeight.w300),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
    );
  }

  static launchURL(String url) async {
    // const url = 'https://flutter.dev/exapmle.pdf';
    /* if (await canLaunch(url)) {
      //header['Authentication'] = SharedPrefs().authTokenn!
      await launch(url,
        forceWebView: true,
            enableJavaScript: true,
            headers:{'Authentication': SharedPrefs().authTokenn!},);
    } else {
      throw 'Could not launch $url';
    }*/
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
      Directory dir = Directory('/storage/emulated/0/Download');
      if (dir != null) {
        var split = url.split("/");
        String savename = "${split[split.length - 1]}";
        String savePath = dir.path + "/$savename";
        print(savePath);
        //output:  /storage/emulated/0/Download/banner.png
        try {
          var d = Dio();
          d.options.headers = {'Authentication': SharedPrefs().authTokenn!};
          await d.download(url, savePath,
              onReceiveProgress: (received, total) async {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
              //you can build progressbar feature too

            }
          });
          OpenFilex.open(savePath);
          print("File is saved to download folder.");
        } on DioError catch (e) {
          print(e.message);
        }
      }
    } else {
      print("No permission to read and write.");
    }

    /* var response =await http.get(Uri.parse(url), headers:{'Authentication': SharedPrefs().authTokenn!});
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    var data = json.decode(response.body);
    var pdfData = base64.decode(data["base64"]);*/
  }
}
