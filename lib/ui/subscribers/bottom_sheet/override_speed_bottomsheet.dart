import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/utils/AppUtils.dart';

import '../../../view_model/subscriber_view_model.dart';

class OverrideSpeedBottomSheet extends StatefulWidget {
  Map subscriberId;
  var updatedSubscriberDetail;

  OverrideSpeedBottomSheet(this.subscriberId, this.updatedSubscriberDetail);

  @override
  _OverrideSpeedBottomSheetState createState() =>
      _OverrideSpeedBottomSheetState();
}

class _OverrideSpeedBottomSheetState extends State<OverrideSpeedBottomSheet>
    with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _uploadEditingController = TextEditingController();
  TextEditingController _downloadEditingController = TextEditingController();
  late SubscriberViewModel subscriberViewModel;

  bool isCheckedOverridePackage = false;
  var _SpeedList = [
    "Kbps",
    "Mbps",
  ];
  String? selectedUploadSpeed = "Mbps";
  String? selectedDownloadSpeed = "Mbps";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.subscriberId['override_package_bandwidth']) {
      isCheckedOverridePackage = true;
      _uploadEditingController.text =
          widget.subscriberId['overridden_bandwidth_upload'].toString();
      _downloadEditingController.text =
          widget.subscriberId['overridden_bandwidth_download'].toString();
      selectedUploadSpeed =
          widget.subscriberId['overridden_bandwidth_upload_unit'] == "k"
              ? "Kbps"
              : "Mbps";
      selectedDownloadSpeed =
          widget.subscriberId['overridden_bandwidth_download_unit'] == "k"
              ? "Kbps"
              : "Mbps";
    }
  }

  @override
  Widget build(BuildContext context) {
    subscriberViewModel = context.watch<SubscriberViewModel>();
    return Container(
      height: 600,
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
                    'Override Package Speed',
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
                      child: CheckboxListTile(
                        title: Text(
                          'Override Package Bandwidth',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        activeColor: Theme.of(context).colorScheme.primary,
                        value: isCheckedOverridePackage,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedOverridePackage = value!;
                          });
                        },
                      ),
                    ),
                    !isCheckedOverridePackage
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'Overridden Upload Bandwidth',
                                          style: GoogleFonts.robotoCondensed(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                            letterSpacing: 1.75,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  _uploadEditingController,
                                              style: GoogleFonts.roboto(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLength: 3,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                hintText:
                                                    'Enter Speed'.toLowerCase(),
                                                hintStyle: GoogleFonts.roboto(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                    letterSpacing: 1.8,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline),
                                                ),
                                                counterText: "",
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: DropdownButtonFormField(
                                                value: selectedUploadSpeed,
                                                style: GoogleFonts.roboto(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                ),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .auto,
                                                  hintText: 'Speed Type'
                                                      .toLowerCase(),
                                                  hintStyle: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      letterSpacing: 1.8,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                  counterText: "",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .outline),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        width: 1),
                                                  ),
                                                ),
                                                items: _SpeedList.map(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: GoogleFonts.roboto(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                focusColor: Colors.white,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedUploadSpeed =
                                                        newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'Overridden Download Bandwidth',
                                          style: GoogleFonts.robotoCondensed(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                            letterSpacing: 1.75,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  _downloadEditingController,
                                              style: GoogleFonts.roboto(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                              maxLength: 3,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                hintText:
                                                    'Enter Speed'.toLowerCase(),
                                                hintStyle: GoogleFonts.roboto(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                    letterSpacing: 1.8,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline),
                                                ),
                                                counterText: "",
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: DropdownButtonFormField(
                                                value: selectedDownloadSpeed,
                                                style: GoogleFonts.roboto(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                ),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .auto,
                                                  hintText: 'Speed Type'
                                                      .toLowerCase(),
                                                  hintStyle: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      letterSpacing: 1.8,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .outline),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        width: 1),
                                                  ),
                                                ),
                                                items: _SpeedList.map(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: GoogleFonts.roboto(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                focusColor: Colors.white,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedDownloadSpeed =
                                                        newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
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
                            /*if (_textEditingController.text.isEmpty) {
                              AppUtils.appToast("Please add some comment.");
                              return;
                            }*/
                            if (isCheckedOverridePackage) {
                              if (_uploadEditingController.text.isEmpty) {
                                AppUtils.appToast(
                                    "Please enter uploading speed");
                                return;
                              }
                              if (_downloadEditingController.text.isEmpty) {
                                AppUtils.appToast(
                                    "Please enter downloading speed");
                                return;
                              }
                            }
                            bool status = false;
                            if (isCheckedOverridePackage) {
                              status = await subscriberViewModel
                                  .updateSubscriber(
                                      widget.subscriberId['id'].toString(), {
                                "status_event": "override_package_speed",
                                "comment": "${_textEditingController.text}",
                                "override_package_bandwidth": "true",
                                "overridden_bandwidth_upload":
                                    "${_uploadEditingController.text}",
                                "overridden_bandwidth_upload_unit":
                                    "${selectedUploadSpeed == "Kbps" ? "k" : "M"}",
                                "overridden_bandwidth_download":
                                    "${_downloadEditingController.text}",
                                "overridden_bandwidth_download_unit":
                                    "${selectedDownloadSpeed == "Kbps" ? "k" : "M"}",
                              });
                            } else {
                              status = await subscriberViewModel
                                  .updateSubscriber(
                                      widget.subscriberId['id'].toString(), {
                                "status_event": "override_package_speed",
                                "comment": "${_textEditingController.text}",
                                "override_package_bandwidth": "false",
                              });
                            }
                            if (status) {
                              widget.updatedSubscriberDetail();
                              AppUtils.appToast("Speed override successfully");
                              Navigator.pop(context);
                            } else {
                              AppUtils.appToast(
                                  "Failed to submit : ${subscriberViewModel.error}");
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
                          child: Text('Submit'),
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
