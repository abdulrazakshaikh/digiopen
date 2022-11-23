import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/nodes/nodestab_audittrail.dart';
import 'package:xceednet/nodes/nodestab_details.dart';
import 'package:xceednet/payment/cancelpayment_bottomsheet.dart';
import 'package:xceednet/payment/closepayment_bottomsheet.dart';
import 'package:xceednet/zones/zonestab_audittrail.dart';
import 'package:xceednet/zones/zonestab_details.dart';

class NodesDetails extends StatefulWidget { 
  @override
  State<NodesDetails> createState() => _NodesDetailsState();
}

class _NodesDetailsState extends State<NodesDetails> with TickerProviderStateMixin {
 
var _ticketStatus = "Open";

late TabController _tabController;

@override
void initState() {   
  super.initState();
  _tabController = TabController(
    initialIndex: 0,
    length: 2,
    vsync: this,
  );
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: 
      _tabController.index == 1 ?
      null :
      FloatingActionButton(
        isExtended: true,
        mini: true,        
        onPressed: (){},
        tooltip: 'Edit',
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: Icon(Icons.create_outlined),
      ),
      appBar: AppBar(
        title: Text('Nodes Details'.toUpperCase()),
        actions: [],
        bottom: TabBar(
          indicatorColor: Theme.of(context).colorScheme.primary,
          indicatorWeight: 3,
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
          isScrollable: false,
          onTap: (int value) {
            setState(() {
              _tabController.index = value;
            });
          },
          tabs: [
            Tab(text: 'Details'),
            Tab(text: 'Audit Trail'),
          ]
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), 
        controller: _tabController,
        children: [

          NodesTabDetails(),
          NodesTabAuditTrail(),
          
        ],
      ),
    );
  }
}

