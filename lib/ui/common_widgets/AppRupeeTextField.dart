import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRupeeTextField extends StatefulWidget {
  var onChange;
  var title;
  var hintText;
  AppRupeeTextField(this.title,this.hintText,{this.onChange});
  @override
  State<StatefulWidget> createState() {
      return AppRupeeTextFieldState();
  }

}
class AppRupeeTextFieldState extends State<AppRupeeTextField> {
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
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
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
                prefixIcon: Icon(Icons.currency_rupee_outlined),
              ),
            ),
          ],
        )
    );
  }

}