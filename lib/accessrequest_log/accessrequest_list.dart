import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';

class AccessRequestList extends StatefulWidget {
  const AccessRequestList({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<AccessRequestList> createState() => _AccessRequestListState();
}

class _AccessRequestListState extends State<AccessRequestList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),       
        actions: [],
      ),
      body: ListView(
        children: [
          HeadToolbar(),

          
        ],
      ),
    );
  }
}
