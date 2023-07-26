import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/override_speed_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/packege_assgin_subscriber_bottomsheet.dart';
import 'package:xceednet/ui/subscribers/bottom_sheet/terminate_bottomsheet.dart';
import 'package:xceednet/utils/AppUtils.dart';

import '../../model/storage/shared_prefs.dart';
import 'bottom_sheet/resetmacaddress_bottomsheet.dart';

class SubscribersDetailsCard extends StatefulWidget {
  Map subscriberDetail;
  var onChange;

  SubscribersDetailsCard(this.subscriberDetail, this.onChange, {Key? key})
      : super(key: key);

  @override
  State<SubscribersDetailsCard> createState() => _SubscribersDetailsCardState();
}

class _SubscribersDetailsCardState extends State<SubscribersDetailsCard>
    with TickerProviderStateMixin {
  bool _isPlanActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPlanActive =
        !widget.subscriberDetail['location_package_name'].toString().isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    String expires_at = " No package";
    String renewed_at = " No package";
    if (widget.subscriberDetail['expires_at'] != null) {
      expires_at = DateFormat('dd-MMM-yyyy hh:mm a').format(
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
              .parse(widget.subscriberDetail['expires_at']));
    }
    if (widget.subscriberDetail['renewed_at'] != null) {
      renewed_at = DateFormat('dd-MMM-yyyy hh:mm a').format(
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
              .parse(widget.subscriberDetail['renewed_at']));
    }

    return Card(
        elevation: 6,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // height: 200,
          // padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getStatus()
                        ? Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'No Package is assigned to subscriber',
                              style: GoogleFonts.robotoCondensed(
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _isPlanActive
                                    ? Text(
                                        '${widget.subscriberDetail['location_package_name'] ?? ""}',
                                        style: GoogleFonts.robotoCondensed(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1,
                                        ),
                                      )
                                    : Text(
                                        'No Plan Active',
                                        style: GoogleFonts.robotoCondensed(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                _isPlanActive
                                    ? Text(
                                        'Current Package',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                          letterSpacing: 1,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                    true
                        ? Container()
                        : Container(
                            width: 48,
                            height: 48,
                            child: PopupMenuButton<String>(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              icon: Icon(Icons.more_vert_outlined),
                              onSelected: (choice) {},
                              color: Theme.of(context).colorScheme.surface,
                              position: PopupMenuPosition.over,
                              tooltip: 'Options',
                              itemBuilder: (BuildContext context) {
                                return Details.choices.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(
                                      choice,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getStatus()
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Renewed At : ',
                                  style: GoogleFonts.robotoCondensed(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    letterSpacing: 1,
                                  ),
                                  children: [TextSpan(text: '$renewed_at')]),
                            ),
                          ),
                    getStatus()
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Expires At   : ',
                                  style: GoogleFonts.robotoCondensed(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    letterSpacing: 1,
                                  ),
                                  children: [TextSpan(text: '$expires_at')]),
                            ),
                          ),
                    getStatus()
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Advance Renewal   : ',
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        letterSpacing: 1,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: widget.subscriberDetail[
                                                    'advance_renewal']
                                                ? "Yes"
                                                : "No")
                                      ]),
                                ),
                              ),
                              widget.subscriberDetail[
                                          'package_time_used_total'] ==
                                      null
                                  ? Container()
                                  : Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                        text: TextSpan(
                                            text: 'Package used   : ',
                                            style: GoogleFonts.robotoCondensed(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              letterSpacing: 1,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: widget.subscriberDetail[
                                                      'package_time_used_total'])
                                            ]),
                                      ),
                                    ),
                              widget.subscriberDetail[
                                          'package_time_used_total'] ==
                                      null
                                  ? Container()
                                  : Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                        text: TextSpan(
                                            text: 'Package used   : ',
                                            style: GoogleFonts.robotoCondensed(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              letterSpacing: 1,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: widget.subscriberDetail[
                                                      'package_time_used_total'])
                                            ]),
                                      ),
                                    ),
                              !widget.subscriberDetail[
                                      'override_package_bandwidth']
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    'Override Package Speed : ',
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  letterSpacing: 1,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: widget.subscriberDetail[
                                                              'override_package_bandwidth']
                                                          ? "Yes"
                                                          : "No")
                                                ]),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    'Overridden Bandwidth (Upload) : ',
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  letterSpacing: 1,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "${widget.subscriberDetail['overridden_bandwidth_upload']}${widget.subscriberDetail['overridden_bandwidth_upload_unit']}")
                                                ]),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        'Overridden Bandwidth (Download) : ',
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      letterSpacing: 1,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "${widget.subscriberDetail['overridden_bandwidth_download']}${widget.subscriberDetail['overridden_bandwidth_download_unit']}")
                                                    ]),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  openOverridePackage(context);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  padding: EdgeInsets.only(
                                                      left: 3,
                                                      right: 3,
                                                      top: 1,
                                                      bottom: 1),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                  ),
                                                  child: Text(
                                                    "edit",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                    !widget.subscriberDetail['status_events']
                            .contains('assign_package')
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    packageAssignBottomSheetCall(
                                        context, "assign_package");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Assign Package'),
                                ),
                              ),
                            ],
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !widget.subscriberDetail['status_events']
                                .contains('change_package')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    packageAssignBottomSheetCall(
                                        context, "change_package");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Change Package'),
                                ),
                              ),
                        !widget.subscriberDetail['status_events']
                                .contains('change_package')
                            ? Container()
                            : SizedBox(
                                width: 10,
                              ),
                        !widget.subscriberDetail['status_events']
                                .contains('renew_package')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    packageAssignBottomSheetCall(
                                        context, "renew_package");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Renew Peckage'),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !widget.subscriberDetail['status_events']
                                .contains('renew_in_advance')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    packageAssignBottomSheetCall(
                                        context, "renew_in_advance");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Renew in Advance'),
                                ),
                              ),
                        !widget.subscriberDetail['status_events']
                                .contains('cancel_advance_renewal')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    packageAssignBottomSheetCall(
                                        context, "cancel_advance_renewal");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Cancel Advance Renewal'),
                                ),
                              ),
                        !widget.subscriberDetail['status_events']
                                    .contains('renew_in_advance') &&
                                !widget.subscriberDetail['status_events']
                                    .contains('cancel_advance_renewal')
                            ? Container()
                            : SizedBox(
                                width: 10,
                              ),
                        !widget.subscriberDetail['status_events']
                                .contains('change_expiry_date')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    packageAssignBottomSheetCall(
                                        context, "change_expiry_date");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Change Expiry Date'),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !widget.subscriberDetail['status_events']
                                .contains('override_package_speed')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    openOverridePackage(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Override Package Speed'),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !widget.subscriberDetail['status_events']
                                .contains('terminate')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
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
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: TerminateBottomSheet(
                                                  widget.subscriberDetail["id"]
                                                      .toString(), () {
                                                widget.onChange();
                                              }));
                                        });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Terminate'),
                                ),
                              ),
                        !widget.subscriberDetail['status_events']
                                .contains('terminate')
                            ? Container()
                            : SizedBox(
                                width: 10,
                              ),
                        !widget.subscriberDetail['status_events']
                                .contains('topup_data')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    openOverridePackage(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Topup Data'),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !widget.subscriberDetail['status_events']
                                .contains('cancel_package')
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
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
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: ResetMacAddressBottomSheet(
                                                widget.subscriberDetail['id']
                                                    .toString(),
                                                type: "Cancel Package",
                                                updatedSubscriberDetail: () {
                                                  widget.onChange();
                                                },
                                              ));
                                        });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor: Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  child: Text('Cancel Package'),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1, color: Theme.of(context).dividerColor))),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.subscriberDetail['balance_amount_human']}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle:
                                  Theme.of(context).textTheme.headlineSmall,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'Balance ',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextButton(
                          onPressed: () {
                            try {
                              AppUtils.launchURL(
                                ""
                                "${SharedPrefs().getDomainUrl()}/subscribers/${widget.subscriberDetail["id"]}/generate_caf_form.pdf",
                              );
                            } catch (e) {
                              AppUtils.appToast(e.toString());
                            }
                          },
                          child: Row(
                            children: [
                              Text('Generate CAF (PDF)'),
                              SizedBox(width: 3),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 18,
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            textStyle: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                fontSize: 14),
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void openOverridePackage(BuildContext context) {
    showModalBottomSheet(
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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: OverrideSpeedBottomSheet(widget.subscriberDetail, () {
            widget.onChange();
          }),
        );
      },
    );
  }

  void packageAssignBottomSheetCall(BuildContext context, String status) {
    showModalBottomSheet(
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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: PackageAssginSubscriberBottomSheet(
              status, widget.subscriberDetail, updatedSubscriberDetail: () {
            widget.onChange();
          }),
        );
      },
    );
  }

  getStatus() =>
      widget.subscriberDetail['status_events'].contains('assign_package') ||
      widget.subscriberDetail['expires_at'] == null;
}

class Details {
  static const String FirstItem = 'Add Invoices';
  static const String SecondItem = 'View Payments';
  static const String ThirdItem = 'Receive Payments';
  static const String FourthItem = 'Add Ticket';
  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
    FourthItem
  ];
}
