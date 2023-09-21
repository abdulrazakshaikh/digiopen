import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/subscribers/subscriber_bottomsheet.dart';

import '../../utils/AppUtils.dart';
import '../../view_model/payment_view_model.dart';

class InvoiceAdd extends StatefulWidget {
  final bool isEdit;
  final Map? paymentDetails;

  InvoiceAdd({this.isEdit = false, this.paymentDetails = null});

  @override
  State<InvoiceAdd> createState() => _InvoiceAddState();
}

class _InvoiceAddState extends State<InvoiceAdd> {
  var _formKey = GlobalKey<FormState>();

  var selectedSubscriber = null;
  var selectedPaymentMode = "cash";
  var selectedReceiver = null;
  var _otherapplicableCharges = false;
  var _AdjustmentApplicable = false;
  var _ServiceTaxApplicable = false;
  var _GSTApplicable = false;
  var _VATApplicable = false;
  var _RoundOffApplicable = false;
  late PaymentViewModel paymentViewModel;
  TextEditingController invoiceController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController invoiceDueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController otherTotalAmountController = TextEditingController();
  TextEditingController otherChargeDescriptionController =
      TextEditingController();
  TextEditingController adjustmentAmountController = TextEditingController();
  TextEditingController adjustmentDescriptionController =
      TextEditingController();
  TextEditingController receiptController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController chequeNoController = TextEditingController();
  TextEditingController chequeDateController = TextEditingController();
  TextEditingController chequeBankController = TextEditingController();
  TextEditingController subscriberController = TextEditingController();
  TextEditingController packageController = TextEditingController();
  TextEditingController assignController = TextEditingController();
  TextEditingController userController = TextEditingController();
  Map? subscriberMap = null;
  Map? subscriberUser = null;
  Map? packageSelected = null;
  Map data = {'mode_of_payment': 'cash'};

  @override
  void initState() {
    // TODO: implement initState
    if (widget.isEdit) {
      invoiceController.text = widget.paymentDetails!['payment_no'];
      invoiceDateController.text = widget.paymentDetails!['payment_date'];
      subscriberController.text = widget.paymentDetails!['subscriber_name'];
      descriptionController.text = widget.paymentDetails!['description'];
      amountController.text =
          (widget.paymentDetails!['amount_cents'] / 100).toString();
      selectedPaymentMode = widget.paymentDetails!['mode_of_payment'];
      subscriberMap = {
        'subscribers.subscriberid': widget.paymentDetails!['subscriber_id'],
        'subscribers.name': widget.paymentDetails!['subscriber_name']
      };
      /*subscriberUser={'subscribers.subscriberid':widget.paymentDetails!['subscriber_id'],
      'subscribers.name':widget.paymentDetails!['subscriber_name']};*/
      if (selectedPaymentMode == 'cheque') {
        chequeNoController.text = widget.paymentDetails!['check_no'];
        chequeDateController.text =
            widget.paymentDetails!['check_date'].toString();
        chequeBankController.text =
            widget.paymentDetails!['check_issued_by_bank'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    paymentViewModel = context.watch<PaymentViewModel>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.isEdit ? "Edit Invoice Detail" : "Add Invoice"),
        actions: [],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4))),
        child: paymentViewModel.isLoading
            ? Container(
                width: 50,
                height: 50,
                child: Center(child: CircularProgressIndicator()))
            : Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool status = widget.isEdit
                              ? await paymentViewModel.updateSubscriber(
                                  widget.paymentDetails!['id'].toString(), data)
                              : await paymentViewModel.addSubscriber(data);
                          if (status) {
                            if (widget.isEdit) {
                              AppUtils.appToast(
                                  "Invoice Updated Successfully!");
                            } else {
                              AppUtils.appToast("Invoice Added Successfully!");
                            }
                            Navigator.pop(context, true);
                          } else {
                            AppUtils.appToast("${paymentViewModel.error}");
                          }
                        } else {
                          // AppUtils.appToast("${subscriberViewModel.error}");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        alignment: Alignment.center,
                      ),
                      child: Text(widget.isEdit ? "Update" : 'Create'),
                    ),
                  )
                ],
              ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
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
                            'Invoice#',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: invoiceController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['payment_no'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter Invoice#"),
                        ),
                      ],
                    )),
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Subscriber',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextFormField(
                          readOnly: true,
                          controller: subscriberController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please select subscriber";
                            } else {
                              data['subscriber_id'] =
                                  subscriberMap!['subscribers.subscriberid'];
                              return null;
                            }
                          },
                          onTap: () async {
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
                                return SubscriberSingleSelectionBottomSheet(
                                    subscriberMap, (selectedItem) {
                                  setState(() {
                                    subscriberMap = selectedItem;
                                    subscriberController.text =
                                        subscriberMap!['subscribers.name'];
                                  });
                                });
                              },
                            );
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Select Subscriber")
                              .copyWith(
                                  suffixIcon: Icon(Icons.arrow_drop_down))),
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
                          'Assigned to',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextFormField(
                          readOnly: true,
                          controller: assignController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please select user";
                            } else {
                              data['subscriber_id'] =
                                  subscriberMap!['subscribers.subscriberid'];
                              return null;
                            }
                          },
                          onTap: () async {
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
                                return SubscriberSingleSelectionBottomSheet(
                                    subscriberMap, (selectedItem) {
                                  setState(() {
                                    subscriberMap = selectedItem;
                                    subscriberController.text =
                                        subscriberMap!['subscribers.name'];
                                  });
                                });
                              },
                            );
                          },
                          decoration:
                              AppUtils.getTextForField(context, "Select user")
                                  .copyWith(
                                      suffixIcon: Icon(Icons.arrow_drop_down))),
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
                        'Invoice Date',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: invoiceDateController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please select invoice date";
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2100));
                        invoiceDateController.text =
                            DateFormat('dd-MMM-yyyy').format(dateTime!);
                        data['payment_date'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration:
                          AppUtils.getTextForField(context, "Invoice Date")
                              .copyWith(
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Due By',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: invoiceDueController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please select invoice date";
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2100));
                        invoiceDueController.text =
                            DateFormat('dd-MMM-yyyy').format(dateTime!);
                        data['payment_date'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration: AppUtils.getTextForField(context, "Due Date")
                          .copyWith(
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                )),
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Package',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextFormField(
                          readOnly: true,
                          controller: packageController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please select package";
                            } else {
                              data['subscriber_id'] =
                                  packageSelected!['subscribers.subscriberid'];
                              return null;
                            }
                          },
                          onTap: () async {
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
                                return SubscriberSingleSelectionBottomSheet(
                                    packageSelected, (selectedItem) {
                                  setState(() {
                                    packageSelected = selectedItem;
                                    packageController.text =
                                        subscriberMap!['subscribers.name'];
                                  });
                                });
                              },
                            );
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Select Package")
                              .copyWith(
                                  suffixIcon: Icon(Icons.arrow_drop_down))),
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
                        'For period',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: invoiceDueController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please select invoice date";
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2100));
                        invoiceDueController.text =
                            DateFormat('dd-MMM-yyyy').format(dateTime!);
                        data['payment_date'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration:
                          AppUtils.getTextForField(context, "For period Date")
                              .copyWith(
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Description',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      maxLines: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        } else {
                          data['description'] = value;
                        }
                      },
                      decoration: AppUtils.getTextForField(
                          context, "Enter Description"),
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
                            'Total Amount',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: totalAmountController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Total Amount")
                              .copyWith(
                            counterText: "",
                            prefixIcon: Icon(Icons.currency_rupee_outlined),
                          ),
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
                            'Amount',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: amountController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },
                          decoration:
                              AppUtils.getTextForField(context, "Enter Amount")
                                  .copyWith(
                            counterText: "",
                            prefixIcon: Icon(Icons.currency_rupee_outlined),
                          ),
                        ),
                      ],
                    )),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Other applicable charges',
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
                    value: _otherapplicableCharges,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _otherapplicableCharges = value!;
                      });
                    },
                  ),
                ),
                _otherapplicableCharges == false
                    ? Container()
                    : AnimatedContainer(
                        duration: Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Other charge',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter Total Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Other charge description',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: commentController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return null;
                                              } else {
                                                data['comment'] = value;
                                              }
                                            },
                                            maxLines: 4,
                                            decoration: AppUtils.getTextForField(
                                                context,
                                                "Enter Other charge description"),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Adjustment applicable',
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
                    value: _AdjustmentApplicable,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _AdjustmentApplicable = value!;
                      });
                    },
                  ),
                ),
                _AdjustmentApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Adjustment amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Adjustment amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Adjustment description',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: commentController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return null;
                                              } else {
                                                data['comment'] = value;
                                              }
                                            },
                                            maxLines: 4,
                                            decoration: AppUtils.getTextForField(
                                                context,
                                                "Enter Adjustment description"),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Discount to subscriber',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: amountController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Discount to subscriber")
                              .copyWith(
                            counterText: "",
                            prefixIcon: Icon(Icons.currency_rupee_outlined),
                            suffixIcon: Icon(Icons.percent),
                          ),
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
                            'Discount to subscriber amount',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: amountController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(context,
                                  "Enter Discount to subscriber amount")
                              .copyWith(
                            counterText: "",
                            prefixIcon: Icon(Icons.currency_rupee_outlined),
                          ),
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
                            'Total amount before tax',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: amountController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Total amount before tax")
                              .copyWith(
                            counterText: "",
                            prefixIcon: Icon(Icons.currency_rupee_outlined),
                          ),
                        ),
                      ],
                    )),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Service tax applicable',
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
                    value: _ServiceTaxApplicable,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _ServiceTaxApplicable = value!;
                      });
                    },
                  ),
                ),
                _ServiceTaxApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Service tax rate',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Adjustment amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon: Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Service tax amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Service tax amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'GST Applicable',
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
                    value: _GSTApplicable,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _GSTApplicable = value!;
                      });
                    },
                  ),
                ),
                _GSTApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'GST#',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: packageController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return null;
                                              } else {
                                                data['payment_no'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                    context, "Enter GST#"),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'CGST Rate',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter CGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon: Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'CGST Amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter CGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'SGST Rate',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter SGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon: Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'SGST Amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter SGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'UGST Rate',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter UGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon: Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'UGST Amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter UGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'IGST Rate',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter IGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon: Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'IGST Amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter IGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'VAT Applicable',
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
                    value: _VATApplicable,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _VATApplicable = value!;
                      });
                    },
                  ),
                ),
                _VATApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'VAT Rate',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter VAT Rate")
                                                    .copyWith(
                                              counterText: "",
                                              suffixIcon: Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'VAT Amount',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                letterSpacing: 1.75,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            readOnly: true,
                                            controller: amountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  int.parse(value) < 0) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['amount'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter VAT Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Round off applicable',
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
                    value: _RoundOffApplicable,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _RoundOffApplicable = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
