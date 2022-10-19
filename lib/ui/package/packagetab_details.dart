import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTabDetails extends StatefulWidget {
  @override
  _PackageTabDetailsState createState() => new _PackageTabDetailsState();
}

class _PackageTabDetailsState extends State<PackageTabDetails> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'DETAILS',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      
      ],
    );   
  }
}