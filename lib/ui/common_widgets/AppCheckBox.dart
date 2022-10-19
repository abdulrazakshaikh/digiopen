import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  var onChange;
  var title;
  var defaultValue=false;
  AppTextField(this.title,{this.defaultValue=false,this.onChange});
  @override
  State<StatefulWidget> createState() {
      return AppTextFieldState();
  }

}
class AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
      child: CheckboxListTile(
        title: Text(widget.title,
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
        dense: true,
        contentPadding: EdgeInsets.zero,
        activeColor: Theme.of(context).colorScheme.primary,
        value: widget.defaultValue,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (newValue){

          widget.onChange(newValue);
          setState(() {
            widget.defaultValue=newValue!;
          });
        },
      ),
    );
  }

}