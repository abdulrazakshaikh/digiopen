import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/subscribers/subscriber_bottomsheet.dart';

import '../../utils/AppUtils.dart';
import '../../view_model/payment_view_model.dart';
import '../subscribers/user_bottomsheet.dart';

class PaymentAdd extends StatefulWidget {
  final bool isEdit;
  final Map? paymentDetails;

  PaymentAdd({this.isEdit = false, this.paymentDetails = null});

  @override
  State<PaymentAdd> createState() => _PaymentAddState();
}

class _PaymentAddState extends State<PaymentAdd> {
  var subscriberList = [
    "Subscriber 1",
    "Subscriber 2",
    "Subscriber 3",
    "Subscriber 4",
    "Subscriber 5",
    "Subscriber 6",
    "Subscriber 7",
  ];
  var list = [
    "cash",
    "cheque",
    "debit card",
    "credit card",
    "net banking",
    "online payment",
    "other"
  ];
  var _formKey = GlobalKey<FormState>();

  var selectedSubscriber = null;
  var selectedPaymentMode = "cash";
  var selectedReceiver = null;
  var _receivedByMe = true;
  late PaymentViewModel paymentViewModel;
  TextEditingController paymentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController receiptController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController chequeNoController = TextEditingController();
  TextEditingController chequeDateController = TextEditingController();
  TextEditingController chequeBankController = TextEditingController();
  TextEditingController subscriberController = TextEditingController();
  TextEditingController userController = TextEditingController();
  Map? subscriberMap = null;
  Map? subscriberUser = null;
  Map data = {'mode_of_payment': 'cash', "received_by_id": "1"};

  @override
  void initState() {
    // TODO: implement initState
    if (widget.isEdit) {
      paymentController.text = widget.paymentDetails!['payment_no'];
      dateController.text = widget.paymentDetails!['payment_date'];
      subscriberController.text = widget.paymentDetails!['subscriber_name'];
      receiptController.text = widget.paymentDetails!['receipt_no'];
      descriptionController.text = widget.paymentDetails!['description'];
      amountController.text =
          (widget.paymentDetails!['amount_cents'] / 100).toInt().toString();
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
      data.remove("received_by_id");
      print(widget.paymentDetails);
      data['subscriber_id'] = widget.paymentDetails!['subscriber_id'];
    }
  }

  @override
  Widget build(BuildContext context) {
    paymentViewModel = context.watch<PaymentViewModel>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.isEdit ? "Edit Payment Detail" : "Add Payment"),
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
                                  "Payment Updated Successfully!");
                            } else {
                              AppUtils.appToast("Payment Added Successfully!");
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
                            'Payment#',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: paymentController,
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
                              context, "Enter Payment#"),
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
                          if (widget.isEdit) {
                            return null;
                          }
                          if (value!.isEmpty) {
                            return "please select subscriber";
                          } else {
                            data['subscriber_id'] =
                                subscriberMap!['subscribers.id'];
                            return null;
                          }
                        },
                        onTap: () async {
                          if (widget.isEdit) {
                            return;
                          }
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
                            .copyWith(),
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
                        'Payment Date',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: dateController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please select payment date";
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
                        dateController.text =
                            DateFormat('dd-MMM-yyyy').format(dateTime!);
                        data['payment_date'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration:
                          AppUtils.getTextForField(context, "Payment Date")
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
                            if (value!.isEmpty ||
                                int.parse(value.toString()) < 0) {
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Mode of payment',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: selectedPaymentMode,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Select Mode of payment'.toLowerCase(),
                          hintStyle: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
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
                        items: list.map((String value) {
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
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPaymentMode = newValue!;
                            data['mode_of_payment'] = newValue.toLowerCase();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                selectedPaymentMode == null || selectedPaymentMode != "cheque"
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
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            'Cheque No',
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
                                          controller: chequeNoController,
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                          maxLength: 10,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter cheque no"
                                                  .toLowerCase();
                                            } else {
                                              data['check_no'] = value;
                                            }
                                          },
                                          decoration: AppUtils.getTextForField(
                                                  context, "Enter Cheque No")
                                              .copyWith(
                                            counterText: "",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'Cheque Date',
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
                                        readOnly: true,
                                        controller: chequeDateController,
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter cheque date"
                                                .toLowerCase();
                                          } else {
                                            data['check_date'] = value;
                                          }
                                        },
                                        onTap: () async {
                                          DateTime? dateTime =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2021),
                                                  lastDate: DateTime(2100));
                                          chequeDateController.text =
                                              DateFormat('dd-MMM-yyyy')
                                                  .format(dateTime!);
                                          data['payment_date'] =
                                              DateFormat('yyy-MM-dd')
                                                  .format(dateTime);
                                        },
                                        decoration: AppUtils.getTextForField(
                                                context, "Cheque Date")
                                            .copyWith(
                                          suffixIcon: Icon(
                                              Icons.calendar_month_outlined),
                                        ),
                                      ),
                                    ],
                                  )),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            'Check issued by bank',
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
                                          controller: chequeBankController,
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter cheque issued by bank"
                                                  .toLowerCase();
                                            } else {
                                              data['check_issued_by_bank'] =
                                                  value;
                                            }
                                          },
                                          decoration: AppUtils.getTextForField(
                                                  context,
                                                  "Cheque issued by bank")
                                              .copyWith(),
                                        ),
                                      ],
                                    ),
                                  ),
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
                            'Receipt#',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: receiptController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['receipt_no'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter Receipt#"),
                        ),
                      ],
                    )),
                true
                    ? Container()
                    : Container(
                        child: CheckboxListTile(
                          title: Text(
                            'Received by me',
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
                          value: _receivedByMe,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              _receivedByMe = value!;
                            });
                          },
                        ),
                      ),
                _receivedByMe == true
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
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            'Received by',
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
                                          readOnly: true,
                                          controller: userController,
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please select user";
                                            } else {
                                              data['received_by_id'] =
                                                  subscriberUser!['user_id'];
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
                                                return UserSingleSelectionBottomSheet(
                                                    subscriberUser,
                                                    (selectedItem) {
                                                  setState(() {
                                                    subscriberUser =
                                                        selectedItem;
                                                    userController.text =
                                                        subscriberUser!['name'];
                                                  });
                                                });
                                              },
                                            );
                                          },
                                          decoration: AppUtils.getTextForField(
                                                  context, "Select received by")
                                              .copyWith(
                                                  suffix: Icon(
                                                      Icons.arrow_drop_down)),
                                        ),
                                      ],
                                    ),
                                  ),
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
                            'Comment',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: commentController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
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
                              context, "Enter Comment"),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
