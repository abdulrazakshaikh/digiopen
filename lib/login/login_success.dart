import 'package:xceednet/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSuccess extends StatefulWidget {
  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}


class _LoginSuccessState extends State<LoginSuccess> with TickerProviderStateMixin{
    
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement<void, void>(context, 
        MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(title: 'Dashboard')
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 300, width: 300,
                child: Image.asset('assets/images/success.png', fit: BoxFit.contain),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text('Congratulations',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text('you have logged in to your account successfully', textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        letterSpacing: 1.5
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
