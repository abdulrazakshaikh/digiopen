import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/reports/alerts_reports.dart';
import 'package:xceednet/reports/package_reports.dart';
import 'package:xceednet/reports/subscribers_reports.dart';
import 'package:xceednet/reports/usage_reports.dart';

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
            Tab(text: 'Subscribers Reports'),
            Tab(text: 'Package Reports'),
            Tab(text: 'Usage Reports'),
            Tab(text: 'Alerts Reports'),
          ]
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), 
        controller: _tabController,
        children: [
          
          SubscribersReports(),
          PackageReports(),
          UsageReports(),
          AlertsReports(),
          
          
        ],
      ),
    );
  }
}
