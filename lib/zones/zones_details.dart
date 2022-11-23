import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/payment/cancelpayment_bottomsheet.dart';
import 'package:xceednet/payment/closepayment_bottomsheet.dart';
import 'package:xceednet/zones/zonestab_audittrail.dart';
import 'package:xceednet/zones/zonestab_details.dart';

class ZonesDetails extends StatefulWidget { 
  @override
  State<ZonesDetails> createState() => _ZonesDetailsState();
}

class _ZonesDetailsState extends State<ZonesDetails> with TickerProviderStateMixin {
 
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

void _onChoiceSelected(String choice) {
  showModalBottomSheet(    
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context, builder: (BuildContext context) { 
      return 
      choice == 'Cancel Payment' ? CancelPaymentBottomSheet() :
      choice == 'Close Payment' ? ClosePaymentBottomSheet() :
      choice == 'Printable Payment' ? Container() :
      Container();
    }, 
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
        title: Text('Zone Details'.toUpperCase()),
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

          ZonesTabDetails(),
          ZonesTabAuditTrail(),
          
        ],
      ),
    );
  }
}

