import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/profile/changepassword_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/disablesubscriber_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/instantsms_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/resetmacaddress_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/datausage.dart';
import 'package:xceednet/ui/subscribers/subscribers_add.dart';
import 'package:xceednet/ui/subscribers/subscribers_details_card.dart';
import 'package:xceednet/ui/subscribers/tab_connection.dart';
import 'package:xceednet/ui/subscribers/tab_details.dart';

import '../../view_model/subscriber_view_model.dart';
import '../accessrequest_log/accessrequest_list.dart';
import 'bottom_sheet/delete_bottomsheet.dart';
import 'bottom_sheet/migration_to_other_bottomsheet.dart';

class SubscribersDetails extends StatefulWidget {
  String subscriberId;

  SubscribersDetails(this.subscriberId);

  @override
  State<SubscribersDetails> createState() => _SubscribersDetailsState();
}

class _SubscribersDetailsState extends State<SubscribersDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late SubscriberViewModel subscriberViewModel;
  Map? subscriberDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await callAPI();
    });
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  Future<void> callAPI() async {
    bool a = await subscriberViewModel.getSubscriberDetailData(
        subscriberId: widget.subscriberId);
    if (a) {
      subscriberDetail = subscriberViewModel.subscriberDetail;
      setState(() {});
    }
  }

  bool _isPlanActive = true;

  void _onChoiceSelected(String choice) {
    if (choice == "Refresh") {
      callAPI();
      return;
    }
    choice == 'Data Usage'
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    DataUsage(subscriberDetail: subscriberDetail)))
        : showModalBottomSheet(
            elevation: 2,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: choice == 'Reset MAC Address' ||
                          choice == 'terminate' ||
                          choice == 'Cancel Package'
                      ? ResetMacAddressBottomSheet(
                          widget.subscriberId,
                          type: choice,
                          updatedSubscriberDetail: () {
                            callAPI();
                          },
                        )
                      : choice == 'Delete Subscriber'
                          ? DeleteBottomSheet(
                              widget.subscriberId.toString(),
                              () {
                                Navigator.pop(context);
                              },
                            )
                          : choice == 'Disable Subscriber'
                              ? DisableSubscriberBottomSheet(
                                  widget.subscriberId,
                                  status:
                                      subscriberDetail!['status'] != "disabled"
                                          ? "disable"
                                          : "enable",
                                  updatedSubscriberDetail: () {
                                    callAPI();
                                  },
                                )
                              : choice == 'Change Password'
                                  ? ChangePasswordBottomSheet(
                                      subscriberId: widget.subscriberId,
                                    )
                                  : choice == 'Migrate to other location'
                                      ? MigrateSubscriberBottomSheet(
                                          widget.subscriberId,
                                        )
                                      : DisableSubscriberBottomSheet(
                                          widget.subscriberId,
                                          status: subscriberDetail!['status'] !=
                                                  "disabled"
                                              ? "disable"
                                              : "enable",
                                          updatedSubscriberDetail: () {
                                            callAPI();
                                          },
                                        ));
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    subscriberViewModel = context.watch<SubscriberViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: _tabController.index == 2
          ? null
          : FloatingActionButton(
        isExtended: true,
              mini: true,
              onPressed: () async {
                bool a = await Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FadeTransition(
                            opacity: animation,
                            child: SubscribersAdd(
                              title: 'Edit Subscriber',
                              isEdit: true,
                              subscriberDetails: subscriberDetail,
                            )),
                  ),
                );
                callAPI();
              },
              tooltip: 'Edit',
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(Icons.create_outlined),
            ),
      appBar: subscriberViewModel.isLoading
          ? AppBar(
              title: Text(
                'Subscriber Detail',
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
                    Container(
                      width: 36,
                      height: 36,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/default.jpg'),
                        radius: 60,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${subscriberDetail!['name']}',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).appBarTheme.titleTextStyle),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              '${subscriberDetail!['mobile1']}',
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle,
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
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
                                color:
                                    subscriberDetail!['status'] == "expired" ||
                                            subscriberDetail!['status'] ==
                                                "disabled"
                                        ? Colors.red
                                        : Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Text(
                                "${subscriberDetail!['status']}",
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
                IconButton(
                  tooltip: 'Access Log',
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                                opacity: animation,
                                child: AccessRequestList(
                                  name: subscriberDetail!['name'],
                                  subscriber_id:
                                      subscriberDetail!['id'].toString(),
                                )),
                      ),
                    );
                  },
                  icon: Icon(Icons.description_outlined),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(40, 40),
                    fixedSize: Size(40, 40),
                  ),
                ),
                true
                    ? Container()
                    : IconButton(
                        tooltip: 'Instant SMS',
                        onPressed: () {
                          showModalBottomSheet(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return InstantSmsBottomSheet();
                            },
                          );
                        },
                        icon: Icon(Icons.sms_outlined),
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          // foregroundColor: Theme.of(context).colorScheme.primary,
                          minimumSize: Size(54, 54),
                          fixedSize: Size(54, 54),
                        ),
                      ),
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
                      return Constants(subscriberDetail!['status_events'])
                          .choices
                          .map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice,
                              style: Theme.of(context).textTheme.bodyMedium),
                        );
                      }).toList();
                    },
                  ),
                ),
              ],
            ),
      body: RefreshIndicator(
        onRefresh: () {
          callAPI();
          return Future(() => null);
        },
        child: subscriberViewModel.isLoading
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
                        child:
                            SubscribersDetailsCard(subscriberDetail!, () async {
                          await callAPI();
                        }),
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
                            Tab(text: 'Connection'),
                            // Tab(text: 'Audit Trail'),
                          ]),
                    ),
                  ];
                },
                body: TabBarView(
                  // physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    TabDetails(subscriberDetail!),
                    TabConnection(subscriberDetail!),
                    //TabAuditTrail(),
                  ],
                ),
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
  List status;

  Constants(this.status) {
    choices = <String>[];
    if (status.contains("reset_mac")) {
      choices.add(FirstItem);
    }
    if (status.contains('disable')) {
      SecondItem = 'Disable Subscriber';
      choices.add(SecondItem);
    }
    if (status.contains('enable')) {
      SecondItem = 'Enable Subscriber';
      choices.add(SecondItem);
    }
    if (status.contains("change_password")) {
      choices.add(ThirdItem);
    }
    /*if (status.contains("cancel_package")) {
      choices.add(CancelPackageItem);
    }*/
    /* if (status.contains("set_delete")) {
      choices.add(DeteleItem);
    }*/
    choices.add(FourthItem);
    /*if (status.contains("migrate")) {
      choices.add(FivthItem);
    }*/
    choices.insert(0, "Refresh");
  }

  static String FirstItem = 'Reset MAC Address';
  static String SecondItem = "";
  static String ThirdItem = 'Change Password';
  static String FourthItem = 'Data Usage';
  static String FivthItem = 'Migrate to other location';
  static String DeteleItem = 'Delete Subscriber';
  static String CancelPackageItem = 'Cancel Package';
  late List<String> choices;
}
