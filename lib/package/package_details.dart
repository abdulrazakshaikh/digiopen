import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/filter_bottomsheet.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/package/disablepackage_bottomsheet.dart';
import 'package:xceednet/package/packagetab_addresslist.dart';
import 'package:xceednet/package/packagetab_audittrail.dart';
import 'package:xceednet/package/packagetab_burstable.dart';
import 'package:xceednet/package/packagetab_details.dart';
import 'package:xceednet/package/packagetab_limit.dart';
import 'package:xceednet/package/packagetab_minimum.dart';
import 'package:xceednet/package/packagetab_timeslot.dart';
import 'package:xceednet/profile/changepassword_bottomsheet.dart';
import 'package:xceednet/subscribers/datausage.dart';
import 'package:xceednet/subscribers/disablesubscriber_bottomsheet.dart';
import 'package:xceednet/subscribers/instantsms_bottomsheet.dart';
import 'package:xceednet/subscribers/resetmacaddress_bottomsheet.dart';
import 'package:xceednet/subscribers/subscribers_details_card.dart';
import 'package:xceednet/subscribers/tab_audittrail.dart';
import 'package:xceednet/subscribers/tab_connection.dart';
import 'package:xceednet/subscribers/tab_details.dart';

class PackageDetails extends StatefulWidget {
  
  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {   
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 7,
      vsync: this,
    );
  }

  bool _isVoucherAvailable = true;

  bool _isPublished = true;

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
      DisablePackageBottomSheet()
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
      _tabController.index == 6 ?
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
        title: Text('Packages Details'), 
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
                                  Text('Package 100',
                                    style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context).textTheme.headlineSmall,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _isPublished == true ? Colors.greenAccent.shade700 : Colors.redAccent.shade700,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                    child: Text(
                                      _isPublished == true ? 'Published'.toUpperCase() : 'Unpublished'.toUpperCase(),
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
                            Text('Vouchers Batches ',
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
                      ) : Container(),

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
                isScrollable: true,
                onTap: (int value) {
                  setState(() {
                    _tabController.index = value;
                  });
                },
                tabs: [
                  Tab(text: 'Details'),
                  Tab(text: 'Burstable'),
                  Tab(text: 'Minimum'),
                  Tab(text: 'Limit'),
                  Tab(text: 'Timeslot'),
                  Tab(text: 'Address List'),
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

            PackageTabDetails(),
            PackageTabBurstable(),
            PackageTabMinimum(),
            PackageTabLimit(),
            PackageTabTimeslot(),
            PackageTabAddressList(),
            PackageTabAuditTrail(),
           
          ],
        ),
      ),
      
    );
  }
}


class Constants {
  static const String FirstItem = 'Unpublished Package';
  static const String SecondItem = 'Disable Package';
  static const List<String> choices = <String>[FirstItem, SecondItem];
}
