import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabConnection extends StatefulWidget {
  @override
  _TabConnectionState createState() => new _TabConnectionState();
}

class _TabConnectionState extends State<TabConnection> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10,10,10,10),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'TAB CONNECTION',
          style: Theme.of(context).textTheme.displayMedium,
        ),

      ],
      ),
    );
  }
}