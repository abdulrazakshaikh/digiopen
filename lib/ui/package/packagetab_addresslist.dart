import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTabAddressList extends StatefulWidget {
  @override
  _PackageTabAddressListState createState() => new _PackageTabAddressListState();
}

class _PackageTabAddressListState extends State<PackageTabAddressList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'AddressList'.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      
      ],
    );   
  }
}