import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabAuditTrail extends StatefulWidget {
  @override
  _TabAuditTrailState createState() => new _TabAuditTrailState();
}

class _TabAuditTrailState extends State<TabAuditTrail> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
      children: [
        Text(
          'TAB AUDIT TRAIL',
          style: Theme.of(context).textTheme.displayMedium,
        ),

      ],
      ),
    );
  }
}