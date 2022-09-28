import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTabBurstable extends StatefulWidget {
  @override
  _PackageTabBurstableState createState() => new _PackageTabBurstableState();
}

class _PackageTabBurstableState extends State<PackageTabBurstable> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Burstable'.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      
      ],
    );   
  }
}