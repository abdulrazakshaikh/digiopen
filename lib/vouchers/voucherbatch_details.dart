import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/filter_bottomsheet.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/package/packagetab_audittrail.dart';
import 'package:xceednet/package/packagetab_details.dart';
import 'package:xceednet/vouchers/voucherbatchtab_audittrail.dart';
import 'package:xceednet/vouchers/voucherbatchtab_details.dart';

class VoucherBatchDetails extends StatefulWidget {
  
  @override
  State<VoucherBatchDetails> createState() => _VoucherBatchDetailsState();
}

class _VoucherBatchDetailsState extends State<VoucherBatchDetails> with TickerProviderStateMixin {
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

  bool _isVoucherAvailable = true;

  var _isVoucherBatchStatus = 'Open';

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
      choice == 'Disable Subscriber' ?
      Container()
      :
      Container();
    }, 
  );
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
        title: Text('Voucher Batch Details'), 
        scrolledUnderElevation: 0,
      ),
      body: 
      NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                child: Card(
                  elevation: 6,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('YUZUUU',
                                    style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context).textTheme.headlineSmall,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: 
                                      _isVoucherBatchStatus == 'Open' ? Colors.green : 
                                      _isVoucherBatchStatus == 'Expired' ? Colors.redAccent : 
                                      _isVoucherBatchStatus == 'Cancelled' ? Colors.red : 
                                      Colors.redAccent.shade700,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                    child: Text(
                                      _isVoucherBatchStatus == 'Open' ? 'Open'.toUpperCase() : 
                                      _isVoucherBatchStatus == 'Expired' ? 'Expired'.toUpperCase() : 
                                      _isVoucherBatchStatus == 'Cancelled' ? 'Cancelled'.toUpperCase() : 
                                      '-',
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context).appBarTheme.titleTextStyle, 
                                        fontSize: 11, color: Colors.white, letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                             Container(
                              width: 48,
                              height: 48,
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
                        ),
                      ),
                      _isVoucherAvailable == true ?
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Vouchers Used ',
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.labelLarge,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 5),
                            Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              Chip(
                                label: Text('ABC123'.toUpperCase()),
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                labelStyle: GoogleFonts.robotoCondensed(
                                  textStyle: Theme.of(context).textTheme.bodySmall,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Chip(
                                  label: Text('TheNewWelcome500'.toUpperCase()),
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  labelStyle: GoogleFonts.robotoCondensed(
                                    textStyle: Theme.of(context).textTheme.bodySmall,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                Chip(
                                  label: Text('DIWALIOFFER'.toUpperCase()),
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  labelStyle: GoogleFonts.robotoCondensed(
                                    textStyle: Theme.of(context).textTheme.bodySmall,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              
                              
                            ],
                          ),
                          ],
                        )
                      ) : Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                          )
                        ),
                        child: Text('There are no vouchers used ', textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: 0,
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
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), 
          controller: _tabController,
          children: [

            VoucherBatchTabDetails(),
            VoucherBatchTabAuditTrail(),
           
          ],
        ),
      ),
      
    );
  }
}


class Constants {
  static const String FirstItem = 'Change Validity';
  static const String SecondItem = 'Cancel Batch';
  static const String ThirdItem = 'Expire Batch & Subscribers';
  static const String FourthItem = 'Generate CVS File';
  static const String FifthItem = 'Generate PDF File';
  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem, FifthItem];
}
