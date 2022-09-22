import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/reports/report_four.dart';
import 'package:xceednet/reports/report_one.dart';
import 'package:xceednet/reports/report_three.dart';
import 'package:xceednet/reports/report_two.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {   
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),       
        actions: [],
        bottom: TabBar(
          indicatorColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Theme.of(context).colorScheme.secondary,
          unselectedLabelStyle: GoogleFonts.robotoCondensed(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
          ),
          labelColor: Theme.of(context).colorScheme.primary,
          labelStyle: GoogleFonts.robotoCondensed(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600
          ),
          controller: _tabController,
          isScrollable: true,
          onTap: (int value) {
            setState(() {
              _tabController.index = value;
            });
          },
          tabs: [
            Tab(text: 'Lorem One'),
            Tab(text: 'Lorem Two'),
            Tab(text: 'Lorem Three'),
            Tab(text: 'Lorem Four'),
          ]
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), 
        controller: _tabController,
        children: [
          
          ReportOne(),
          ReportTwo(),
          ReportThree(),
          ReportFour(),
          
          
        ],
      ),
    );
  }
}
