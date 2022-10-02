import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDropDown extends StatefulWidget {
  List<String> dropDownList;
  var onChange;
  var title;
  var hintText;
  AppDropDown(this.title,this.hintText,this.dropDownList,this.onChange);
  @override
  State<StatefulWidget> createState() {
      return AppDropDownState();
  }

}
class AppDropDownState extends State<AppDropDown> {
  var dataList=["q"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   dataList.removeAt(0);
    dataList.addAll(widget.dropDownList);
  }
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
          DropdownButtonFormField(
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: widget.hintText.toLowerCase(),
              hintStyle: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w300),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
              ),
            ),
            items: dataList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              );
            }).toList(),
            focusColor: Colors.white,
            onChanged: widget.onChange,
          ),
        ],
      ),
    );
  }

}