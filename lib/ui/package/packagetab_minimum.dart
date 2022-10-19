import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTabMinimum extends StatefulWidget {
  @override
  _PackageTabMinimumState createState() => new _PackageTabMinimumState();
}

class _PackageTabMinimumState extends State<PackageTabMinimum> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Minimum'.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      
      ],
    );   
  }
}