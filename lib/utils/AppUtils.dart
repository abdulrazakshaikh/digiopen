import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

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
}
