import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/view_model/auth_view_model.dart';
import 'package:xceednet/view_model/invoice_view_model.dart';

import '../../../utils/AppUtils.dart';

class CloseCancelInvoiceBottomSheet extends StatefulWidget {
  String paymentId;
  String status;
  var updatedSubscriberDetail;

  CloseCancelInvoiceBottomSheet(this.paymentId,
      {this.status = "close", this.updatedSubscriberDetail});

  @override
  _CloseCancelInvoiceBottomSheetState createState() =>
      _CloseCancelInvoiceBottomSheetState();
}

class _CloseCancelInvoiceBottomSheetState
    extends State<CloseCancelInvoiceBottomSheet> with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  late InvoiceViewModel invoiceViewModel;
  late AuthViewModel authViewModel;
  bool isAssignSelection = false;

  var selectedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.status.contains("assign")) {
      isAssignSelection = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await authViewModel.getAllUserDetail();
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    invoiceViewModel = context.watch<InvoiceViewModel>();
    authViewModel = context.watch<AuthViewModel>();
    return Container(
      height: 400,
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
                    '${widget.status}'.toUpperCase(),
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
                    !isAssignSelection
                        ? Container()
                        : Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Assigned to',
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
                                  value: selectedUser,
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    hintText: 'Select user'.toLowerCase(),
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
                                  items: authViewModel.userList
                                      .map((dynamic value) {
                                    return DropdownMenuItem<dynamic>(
                                      value: value,
                                      child: Text(
                                        value['name'],
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
                                  onChanged: (dynamic? newValue) {
                                    setState(() {
                                      selectedUser = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
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
            child: invoiceViewModel.isUpdateLoading
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
                            if (isAssignSelection && selectedUser == null) {
                              AppUtils.appToast("Please select user.");
                              return;
                            }
                            String status1 = 'close';
                            if (widget.status == "Close Invoice") {
                              status1 = "close";
                            } else if (widget.status == "Cancel Invoice") {
                              status1 = "cancel";
                            } else if (widget.status == "Reassign Invoice") {
                              status1 = "reassign";
                            } else if (widget.status == "Assign Invoice") {
                              status1 = "assign";
                            } else {
                              status1 = "reopen";
                            }
                            var map = {
                              "status_event": "$status1",
                              "comment": "${_textEditingController.text}"
                            };
                            if (isAssignSelection) {
                              map['assigned_to_id'] =
                                  selectedUser['user_id'].toString();
                            }
                            bool status = await invoiceViewModel.updateInvoice(
                                widget.paymentId, map);
                            if (status) {
                              invoiceViewModel.getInvoiceListData();
                              widget.updatedSubscriberDetail();
                              AppUtils.appToast(
                                  "Invoice ${widget.status}d successfully");
                              Navigator.pop(context);
                            } else {
                              AppUtils.appToast(
                                  "Failed to ${widget.status} : ${invoiceViewModel.error}");
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
                          child: Text(
                              '${widget.status.replaceFirst(widget.status[0], widget.status[0].toUpperCase())}'),
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
