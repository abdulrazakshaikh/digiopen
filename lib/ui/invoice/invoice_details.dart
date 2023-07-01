import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/invoice/invoice_details_card.dart';
import 'package:xceednet/ui/profile/changepassword_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/disablesubscriber_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/datausage.dart';
import 'package:xceednet/view_model/invoice_view_model.dart';

import '../subscribers/bottom_sheet/resetmacaddress_bottomsheet.dart';
import 'invoice_tab_details.dart';

class InvoiceDetails extends StatefulWidget {
  String invoiceId;

  InvoiceDetails(this.invoiceId);

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late InvoiceViewModel invoiceViewModel;
  Map? invoiceDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool a = await invoiceViewModel.getInvoiceDetailData(
          invoiceId: widget.invoiceId);
      if (a) {
        invoiceDetail = invoiceViewModel.invoiceDetail;
      }
    });
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  bool _isPlanActive = true;

  void _onChoiceSelected(String choice) {
    choice == 'Data Usage'
        ? Navigator.pushReplacement<void, void>(context,
            MaterialPageRoute(builder: (BuildContext context) => DataUsage()))
        : showModalBottomSheet(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return choice == 'Reset MAC Address'
                  ? ResetMacAddressBottomSheet("")
                  : choice == 'Disable Subscriber'
                      ? DisableSubscriberBottomSheet("")
                      : choice == 'Change Password'
                          ? ChangePasswordBottomSheet()
                          : Container();
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    invoiceViewModel = context.watch<InvoiceViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: _tabController.index == 0
          ? null
          : FloatingActionButton(
              isExtended: true,
              mini: true,
              onPressed: () {},
              tooltip: 'Edit',
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(Icons.create_outlined),
            ),
      appBar: invoiceViewModel.isLoading
          ? AppBar(
              title: Text(
                'Invoice Detail',
                style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).appBarTheme.titleTextStyle),
              ),
            )
          : AppBar(
              // title: Text(widget.title.toUpperCase()),
              scrolledUnderElevation: 0,
              title: Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Invoice #${invoiceDetail!['invoiceid']}',
                              style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context)
                                      .appBarTheme
                                      .titleTextStyle),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 70,
                              padding: EdgeInsets.only(
                                  left: 3, right: 3, top: 1, bottom: 1),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: invoiceDetail!['status'] != "closed"
                                    ? Colors.red
                                    : Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Text(
                                "${invoiceDetail!['status']}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                true
                    ? Container()
                    : Container(
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
                          child: Text(choice,
                              style: Theme.of(context).textTheme.bodyMedium),
                          // onTap: (){
                          //   showModalBottomSheet(
                          //     elevation: 2,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(20),
                          //         topRight: Radius.circular(20),
                          //       ),
                          //     ),
                          //     context: context, builder: (BuildContext context) {
                          //       return FilterBottomSheet();
                          //     },
                          //   );
                          // },
                        );
                      }).toList();
                    },
                  ),
                ),
              ],
            ),
      body: invoiceViewModel.isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                      child: InvoiceDetailsCard(invoiceDetail!),
                    ),
                  ),
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 0,
                    bottom: TabBar(
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        indicatorWeight: 3,
                        unselectedLabelColor:
                            Theme.of(context).colorScheme.secondary,
                        unselectedLabelStyle: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                        labelColor: Theme.of(context).colorScheme.primary,
                        labelStyle: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600),
                        controller: _tabController,
                        // isScrollable: true,r
                        onTap: (int value) {
                          setState(() {
                            _tabController.index = value;
                          });
                        },
                        tabs: [
                          Tab(text: 'Details'),
                          //Tab(text: 'Audit Trail'),
                        ]),
                  ),
                ];
              },
              body: TabBarView(
                // physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  InvoiceTabDetails(invoiceDetail!),
                  //TabAuditTrail(),
                ],
              ),
            ),

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: Colors.white,

      //       actions: <Widget>[
      //         IconButton(icon: Icon(Icons.share), onPressed: () {})
      //       ],
      //       floating: false,
      //       pinned: false,

      //       //title: Text("Flexible space title"),
      //       expandedHeight: 281,
      //       flexibleSpace: Stack(
      //         children: [
      //           Positioned.fill(
      //             child: Container(
      //               width: double.infinity,
      //               height: 250,
      //               color: Colors.grey,
      //               child: Text('Lorem Ipsum Solor SIt amet s opojsiosdoio'),
      //             )
      //           ),
      //           Positioned(
      //             child: Container(
      //               height: 33,
      //               decoration: const BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.vertical(
      //                   top: Radius.circular(40),
      //                 ),
      //               ),
      //             ),
      //             bottom: -7,
      //             left: 0,
      //             right: 0,
      //           )
      //         ],
      //       ),
      //     ),
      //     SliverList(
      //         delegate: SliverChildBuilderDelegate((context, index) {
      //       return ListTile(
      //         tileColor: Colors.white,
      //         title: Text('sassa'),
      //       );
      //     }, childCount: 55))
      //   ],
      // ),
    );
  }
}

class Constants {
  static const String FirstItem = 'Assign Invoice';
  static const String SecondItem = 'Received Payment';
  static const String ThirdItem = 'Cancel Invoice';
  static const String FourthItem = 'Close Invoice';
  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
    FourthItem
  ];
}
