import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/utils/AppUtils.dart';

import '../../../view_model/subscriber_view_model.dart';

class PackageAssginSubscriberBottomSheet extends StatefulWidget {
  Map subscriberDetail;
  String status;
  var updatedSubscriberDetail;

  PackageAssginSubscriberBottomSheet(this.status, this.subscriberDetail,
      {this.updatedSubscriberDetail});

  @override
  _PackageAssginSubscriberBottomSheetState createState() =>
      _PackageAssginSubscriberBottomSheetState();
}

class _PackageAssginSubscriberBottomSheetState
    extends State<PackageAssginSubscriberBottomSheet>
    with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _renewwalDateEditingController =
      TextEditingController();
  TextEditingController _expiryEditingController = TextEditingController();
  TextEditingController _renewwalDateEditingControllerAdvance =
      TextEditingController();
  late SubscriberViewModel subscriberViewModel;
  List<String> subscriberDetaillist = [];
  String title = "";
  bool packageSelectionReadOnly = false;
  bool packageAdvanceSelectionReadOnly = false;
  bool expiryDatePicker = false;

  @override
  void initState() {
    subscriberDetaillist = [];
    widget.subscriberDetail['available_susbcriber_packages']
        .toList()
        .where((i) {
      subscriberDetaillist.add(i['name']);
      return false;
    }).toList();
    print(subscriberDetaillist);
    var currentMonth = DateTime.now();
    var nextMonth = DateTime(currentMonth.year, currentMonth.month + 1,
        currentMonth.day, currentMonth.hour, currentMonth.minute);

    _renewwalDateEditingController.text =
        DateFormat("dd-MMM-yyyy hh:mm a").format(currentMonth);
    _expiryEditingController.text =
        DateFormat("dd-MMM-yyyy hh:mm a").format(nextMonth);
    if (widget.status == "assign_package") {
      title = "Assign Package";
    } else if (widget.status == "change_package") {
      title = "Change Package";
    } else if (widget.status == "renew_package") {
      print("object");
      subscriberDetaillist
          .add(widget.subscriberDetail['location_package_name']);
      selectedPackageName = widget.subscriberDetail['location_package_name'];
      selectedPackage =
          widget.subscriberDetail['location_package_id'].toString();
      packageSelectionReadOnly = true;
      title = "Renew Package";
    } else if (widget.status == "renew_in_advance") {
      title = "Renew In Advance";
      subscriberDetaillist
          .add(widget.subscriberDetail['location_package_name']);
      selectedPackageName = widget.subscriberDetail['location_package_name'];
      selectedPackage =
          widget.subscriberDetail['location_package_id'].toString();
      selectedPackageNameAdvance =
          widget.subscriberDetail['location_package_name'];
      selectedPackageAdvance =
          widget.subscriberDetail['location_package_id'].toString();
      packageSelectionReadOnly = true;
      if (widget.subscriberDetail['expires_at'] != null) {
        _expiryEditingController.text = DateFormat('dd-MMM-yyyy hh:mm a')
            .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(widget.subscriberDetail['expires_at']));
      }
      if (widget.subscriberDetail['renewed_at'] != null) {
        _renewwalDateEditingController.text = DateFormat('dd-MMM-yyyy hh:mm a')
            .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(widget.subscriberDetail['renewed_at']));
        _renewwalDateEditingControllerAdvance.text =
            _renewwalDateEditingController.text;
      }
    } else if (widget.status == "cancel_advance_renewal") {
      title = "Cancel Advance Renewal";
      subscriberDetaillist
          .add(widget.subscriberDetail['location_package_name']);
      selectedPackageName = widget.subscriberDetail['location_package_name'];
      selectedPackage =
          widget.subscriberDetail['location_package_id'].toString();
      packageSelectionReadOnly = true;
      if (widget.subscriberDetail['expires_at'] != null) {
        _expiryEditingController.text = DateFormat('dd-MMM-yyyy hh:mm a')
            .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(widget.subscriberDetail['expires_at']));
      }
      if (widget.subscriberDetail['renewed_at'] != null) {
        _renewwalDateEditingController.text = DateFormat('dd-MMM-yyyy hh:mm a')
            .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(widget.subscriberDetail['renewed_at']));
        _renewwalDateEditingControllerAdvance.text =
            _renewwalDateEditingController.text;
      }

      packageAdvanceSelectionReadOnly = true;
      if (widget.subscriberDetail['location_package_id'] ==
          widget.subscriberDetail['advance_renewal_package_id']) {
        selectedPackageNameAdvance = selectedPackageName;
      } else {
        selectedPackageNameAdvance = widget
            .subscriberDetail['available_susbcriber_packages']
            .toList()
            .where((i) {
          return i['location_package_id'].toString() ==
              widget.subscriberDetail['advance_renewal_package_id'].toString();
        }).toList()[0]['name'];
      }
    } else if (widget.status == "change_expiry_date") {
      subscriberDetaillist
          .add(widget.subscriberDetail['location_package_name']);
      selectedPackageName = widget.subscriberDetail['location_package_name'];
      selectedPackage =
          widget.subscriberDetail['location_package_id'].toString();
      packageSelectionReadOnly = true;
      title = "Change Expiry Date";
      if (widget.subscriberDetail['expires_at'] != null) {
        _expiryEditingController.text = DateFormat('dd-MMM-yyyy hh:mm a')
            .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(widget.subscriberDetail['expires_at']));
      }
      if (widget.subscriberDetail['renewed_at'] != null) {
        _renewwalDateEditingController.text = DateFormat('dd-MMM-yyyy hh:mm a')
            .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .parse(widget.subscriberDetail['renewed_at']));
      }
      expiryDatePicker = true;
    }
  }

  String selectedPackage = "";
  String? selectedPackageName = null;
  String selectedPackageAdvance = "";
  String? selectedPackageNameAdvance = null;

  @override
  Widget build(BuildContext context) {
    subscriberViewModel = context.watch<SubscriberViewModel>();

    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Theme.of(context).colorScheme.surface,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${title}'.toUpperCase(),
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Packages',
                              style: GoogleFonts.robotoCondensed(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          DropdownButtonFormField(
                            value: selectedPackageName,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: 'Select Package'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1),
                              ),
                            ),
                            items: subscriberDetaillist.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              );
                            }).toList(),
                            focusColor: Colors.white,
                            onChanged: packageSelectionReadOnly
                                ? null
                                : (String? newValue) {
                                    setState(() {
                                      selectedPackageName = newValue!;
                                      widget.subscriberDetail[
                                              'available_susbcriber_packages']
                                          .toList()
                                          .where((i) {
                                        print(i);
                                        if (newValue == i['name']) {
                                          selectedPackage =
                                              i['location_package_id']
                                                  .toString();
                                        }
                                        return false;
                                      }).toList();
                                    });
                                  },
                          ),
                          subscriberDetaillist.length == 0
                              ? Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "You need at least one Active Location Package with ${widget.subscriberDetail['subscriber_type']} type.",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Renewal Date & Time',
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  letterSpacing: 1.75,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _renewwalDateEditingController,
                              readOnly: true,
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              decoration: AppUtils.getTextForField(
                                  context, "Renewal Date & Time"),
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Expiry Date & Time',
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  letterSpacing: 1.75,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              onTap: expiryDatePicker
                                  ? () async {
                                      DateTime? dateTime = await showDatePicker(
                                          context: context,
                                          initialDate: DateFormat(
                                                  "yyyy-MM-dd'T'HH:mm:ss.SSS")
                                              .parse(widget.subscriberDetail[
                                                  'expires_at']),
                                          firstDate: DateFormat(
                                                  "yyyy-MM-dd'T'HH:mm:ss.SSS")
                                              .parse(widget.subscriberDetail[
                                                  'expires_at']),
                                          lastDate: DateTime(2100));
                                      _expiryEditingController.text =
                                          DateFormat('dd-MMM-yyyy hh:mm a')
                                              .format(dateTime!);
                                    }
                                  : null,
                              controller: _expiryEditingController,
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              decoration: AppUtils.getTextForField(
                                  context, "Expiry Date & Time"),
                            ),
                          ],
                        )),
                    widget.status != 'renew_in_advance' &&
                            widget.status != 'cancel_advance_renewal'
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        'Advance renewal package',
                                        style: GoogleFonts.robotoCondensed(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                          letterSpacing: 1.75,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    DropdownButtonFormField(
                                      value: selectedPackageNameAdvance,
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        hintText:
                                            'Select Package'.toLowerCase(),
                                        hintStyle: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            letterSpacing: 1.8,
                                            fontWeight: FontWeight.w300),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 1),
                                        ),
                                      ),
                                      items: subscriberDetaillist
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      focusColor: Colors.white,
                                      onChanged: packageAdvanceSelectionReadOnly
                                          ? null
                                          : (String? newValue) {
                                              setState(() {
                                                selectedPackageNameAdvance =
                                                    newValue!;
                                                widget.subscriberDetail[
                                                        'available_susbcriber_packages']
                                                    .toList()
                                                    .where((i) {
                                                  print(i);
                                                  if (newValue == i['name']) {
                                                    selectedPackageAdvance =
                                                        i['location_package_id']
                                                            .toString();
                                                  }
                                                  return false;
                                                }).toList();
                                              });
                                            },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'Will Be Renewed Automatically At',
                                          style: GoogleFonts.robotoCondensed(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                            letterSpacing: 1.75,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            _renewwalDateEditingControllerAdvance,
                                        readOnly: true,
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                        decoration: AppUtils.getTextForField(
                                            context, "Renewal Date & Time"),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                    Container(
                        child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Comment',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _textEditingController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLines: 4,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: 'Enter Comment'.toLowerCase(),
                            hintStyle: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top:
                    BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: subscriberViewModel.isUpdateLoading
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      Container(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                          ),
                          child: Text(
                            'Cancel',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            /*if (_textEditingController.text.isEmpty&&widget.status != "change_expiry_date") {
                              AppUtils.appToast("Please add some comment.");
                              return;
                            }*/
                            if (selectedPackage.isEmpty) {
                              AppUtils.appToast("Please select package.");
                              return;
                            }
                            bool status = false;
                            if (widget.status == "change_expiry_date") {
                              if (_expiryEditingController.text.isEmpty) {
                                AppUtils.appToast("Please select expiry date.");
                                return;
                              }
                              status = await subscriberViewModel
                                  .updateSubscriber(
                                      widget.subscriberDetail['id'].toString(),
                                      {
                                    "status_event": widget.status,
                                    "location_package_id": "$selectedPackage",
                                    "expires_at": _expiryEditingController.text,
                                    "comment": "${_textEditingController.text}"
                                  });
                            } else if (widget.status == "renew_in_advance") {
                              if (selectedPackageAdvance.isEmpty) {
                                AppUtils.appToast(
                                    "Please advance renewal package.");
                                return;
                              }
                              status = await subscriberViewModel
                                  .updateSubscriber(
                                      widget.subscriberDetail['id'].toString(),
                                      {
                                    "status_event": widget.status,
                                    "location_package_id": "$selectedPackage",
                                    "advance_renewal_package_id":
                                        "$selectedPackage",
                                    "comment": "${_textEditingController.text}"
                                  });
                            } else if (widget.status ==
                                "cancel_advance_renewal") {
                              status = await subscriberViewModel
                                  .updateSubscriber(
                                      widget.subscriberDetail['id'].toString(),
                                      {
                                    "status_event": widget.status,
                                    "comment": "${_textEditingController.text}"
                                  });
                            } else {
                              status = await subscriberViewModel
                                  .updateSubscriber(
                                      widget.subscriberDetail['id'].toString(),
                                      {
                                    "status_event": widget.status,
                                    "location_package_id": "$selectedPackage",
                                    "comment": "${_textEditingController.text}"
                                  });
                            }

                            if (status) {
                              widget.updatedSubscriberDetail();
                              AppUtils.appToast(
                                  "Subscriber updated successfully");
                              Navigator.pop(context);
                            } else {
                              AppUtils.appToast(
                                  "Failed to  update: ${subscriberViewModel.error}");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                          ),
                          child: Text('${title} '),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
