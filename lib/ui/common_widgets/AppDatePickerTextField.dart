import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDatePickerTextField extends StatefulWidget {
  var onChange;
  var title;
  var hintText;
  AppDatePickerTextField(this.title,this.hintText,{this.onChange});
  @override
  State<StatefulWidget> createState() {
      return AppDatePickerTextFieldState();
  }

}
class AppDatePickerTextFieldState extends State<AppDatePickerTextField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(widget.title,
              style: GoogleFonts.robotoCondensed(
                textStyle: Theme.of(context).textTheme.labelLarge,
                letterSpacing: 1.75,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextField(
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            onChanged: widget.onChange,
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: widget.hintText.toLowerCase(),
              hintStyle: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w300),

              suffixIcon: Icon(Icons.calendar_month_outlined),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

}