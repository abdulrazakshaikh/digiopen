import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTabTimeslot extends StatefulWidget {
  @override
  _PackageTabTimeslotState createState() => new _PackageTabTimeslotState();
}

class _PackageTabTimeslotState extends State<PackageTabTimeslot> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Timeslot'.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      
      ],
    );   
  }
}