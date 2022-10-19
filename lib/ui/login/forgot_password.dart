import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}


class _ForgotPasswordState extends State<ForgotPassword> with TickerProviderStateMixin{

@override
Widget build(BuildContext context) {
  return Container(
    // padding: EdgeInsets.fromLTRB(15,15,15,15),
    constraints: BoxConstraints(
      // maxHeight: 270,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(15)
    ),

    // height: MediaQuery.of(context).size.height / 3,
    // height: 250,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            
              child: Row(
                children: [
                  Expanded(
                    child: Text('Forgot Password',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)
                  )
                ],
              ),
            ),
          Padding(
          padding: EdgeInsets.fromLTRB(15,15,15,15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextField(
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Enter Email'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w300),
                    prefixIcon: Icon(Icons.alternate_email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),

          Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      alignment: Alignment.center,
                    ),
                    child: Text('Cancel',
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      alignment: Alignment.center,
                    ),
                    child: Text('Reset Password'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

}
