import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTabLimit extends StatefulWidget {
  @override
  _PackageTabLimitState createState() => new _PackageTabLimitState();
}

class _PackageTabLimitState extends State<PackageTabLimit> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Limit'.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      
      ],
    );   
  }
}