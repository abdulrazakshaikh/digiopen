import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/invoice/assigninvoice_bottomsheet.dart';
import 'package:xceednet/invoice/cancelinvoice_bottomsheet.dart';
import 'package:xceednet/invoice/closeinvoice_bottomsheet.dart';
import 'package:xceednet/invoice/invoicetab_audittrail.dart';
import 'package:xceednet/invoice/invoicetab_details.dart';
import 'package:xceednet/leads/assignlead_bottomsheet.dart';
import 'package:xceednet/leads/cancellead_bottomsheet.dart';
import 'package:xceednet/leads/leadtab_audittrail.dart';
import 'package:xceednet/leads/leadtab_details.dart';
import 'package:xceednet/leads/schedulefeasibilitycheck_bottomsheet.dart';
import 'package:xceednet/payment/payment_add.dart';
import 'package:xceednet/tickets/assignticket_bottomsheet.dart';
import 'package:xceednet/tickets/cancelticket_bottomsheet.dart';
import 'package:xceednet/tickets/tickettab_audittrail.dart';
import 'package:xceednet/tickets/tickettab_details.dart';

class InvoiceDetails extends StatefulWidget { 
  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> with TickerProviderStateMixin {
 
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
      choice == 'Assign Invoice' ? AssignInvoiceBottomSheet() :
      choice == 'Receive Payment' ? PaymentAdd(title: 'Receive Payment',) :
      choice == 'Cancel Invoice' ? CancelInvoiceBottomSheet() :
      choice == 'Close Invoice' ? CloseInvoiceBottomSheet() :
      choice == 'Printable Invoice' ? Container() :
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
        // title: Text(widget.title.toUpperCase()),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 36, height: 36,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  child: Icon(Icons.receipt_outlined, color: Theme.of(context).colorScheme.primary,),
                  radius: 60,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#12546458',
                    style: GoogleFonts.roboto(textStyle: Theme.of(context).appBarTheme.titleTextStyle),
                  ),
                  SizedBox(height: 3),
                  Container(
                    decoration: BoxDecoration(
                      color: 
                      _ticketStatus == "Open" ? Colors.blue :
                      _ticketStatus == "Assigned" ? Colors.deepPurple :
                      _ticketStatus == "Reassigned" ? Colors.deepPurple : 
                      _ticketStatus == "Rejected" ? Colors.red :
                      _ticketStatus == "Pending" ? Colors.orange :
                      _ticketStatus == "In Process" ? Colors.blue : 
                      _ticketStatus == "Cancelled" ? Colors.red :
                      _ticketStatus == "Resolved" ? Colors.green :
                      _ticketStatus == "Reopen" ? Colors.blue : 
                      _ticketStatus == "Closed" ? Colors.green : 
                      null,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      _ticketStatus == "Open" ? 'Open'.toUpperCase() :
                      _ticketStatus == "Assigned" ? 'Assigned'.toUpperCase() :
                      _ticketStatus == "Reassigned" ? 'Reassigned'.toUpperCase() :
                      _ticketStatus == "Rejected" ? 'Rejected'.toUpperCase() :
                      _ticketStatus == "Pending" ? 'Pending'.toUpperCase() :
                      _ticketStatus == "In Process" ? 'In Process'.toUpperCase() :
                      _ticketStatus == "Cancelled" ? 'Cancelled'.toUpperCase() :
                      _ticketStatus == "Resolved" ? 'Resolved'.toUpperCase() :
                      _ticketStatus == "Reopen" ? 'Reopen'.toUpperCase() : 
                      _ticketStatus == "Closed" ? 'Closed'.toUpperCase() :
                      '-',
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).appBarTheme.titleTextStyle, 
                        fontSize: 11, color: Colors.white, letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          Container(
            width: 54,
            height: 54,
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(),
              icon: Icon(Icons.more_vert_outlined),
              onSelected: _onChoiceSelected,
              color: Theme.of(context).colorScheme.surface,
              position: PopupMenuPosition.under,
              tooltip: 'Options',
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: Theme.of(context).textTheme.bodyMedium),
                  );
                }).toList();
              },
            ),
          ),
        ],
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

          InvoiceTabDetails(),
          InvoiceTabAuditTrail(),
          
        ],
      ),
    );
  }
}



class Constants {
  static const String FirstItem = 'Assign Invoice';
  static const String SecondItem = 'Receive Payment';
  static const String ThirdItem = 'Cancel Invoice';
  static const String FourthItem = 'Close Invoice';
  static const String FifthItem = 'Printable Invoice';
  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem, FifthItem];
}
