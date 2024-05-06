import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/subscribers/subscriber_bottomsheet.dart';
import 'package:xceednet/view_model/invoice_view_model.dart';

import '../../utils/AppUtils.dart';
import '../package/package_bottomsheet.dart';

class InvoiceAdd extends StatefulWidget {
  final bool isEdit;
  final Map? invoiceDetails;

  InvoiceAdd({this.isEdit = false, this.invoiceDetails = null});

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
  bool isDiscountEditable = true;
  var _ServiceTaxApplicable = false;
  var _GSTApplicable = false;
  var _VATApplicable = false;
  var _RoundOffApplicable = false;

  late InvoiceViewModel invoiceViewModel;
  TextEditingController invoiceController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController invoiceDueController = TextEditingController();
  TextEditingController periodFromController = TextEditingController();
  TextEditingController periodToController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController totalAmountBeforeTaxController =
      TextEditingController();
  TextEditingController otherTotalAmountController = TextEditingController();
  TextEditingController otherChargeDescriptionController =
      TextEditingController();
  TextEditingController adjustmentAmountController = TextEditingController();
  TextEditingController adjustmentDescriptionController =
      TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();

  TextEditingController servicePercentageController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();

  TextEditingController gstController = TextEditingController();
  TextEditingController cgstPercentageController = TextEditingController();
  TextEditingController cgstPriceController = TextEditingController();

  TextEditingController sgstPercentageController = TextEditingController();
  TextEditingController sgstPriceController = TextEditingController();

  TextEditingController ugstPercentageController = TextEditingController();
  TextEditingController ugstPriceController = TextEditingController();

  TextEditingController igstPercentageController = TextEditingController();
  TextEditingController igstPriceController = TextEditingController();

  TextEditingController vatPercentageController = TextEditingController();
  TextEditingController vatPriceController = TextEditingController();

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
  Map data = {};

  @override
  void initState() {
    super.initState();
    var invoiceDetails = widget.invoiceDetails;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isEdit && invoiceDetails != null) {
        receiptController.text = (invoiceDetails['invoiceid'] ?? 0).toString();
        subscriberMap = {
          'subscribers.id': invoiceDetails['subscriber_id'],
          'subscriber_name': invoiceDetails['subscriber_name']
        };
        data['subscriber_id'] = invoiceDetails['subscriber_id'];
        print("data");
        print(data);
        subscriberController.text = invoiceDetails['subscriber_name'];
        invoiceDateController.text = invoiceDetails['invoice_date'];
        invoiceDueController.text = invoiceDetails['due_by'];
        packageSelected = {'name': invoiceDetails['location_package_name']};
        packageController.text = invoiceDetails['location_package_name'];
        periodFromController.text = invoiceDetails['period_from'] ?? "";
        periodToController.text = invoiceDetails['period_to'] ?? "";
        descriptionController.text = invoiceDetails['description'] ?? "";
        amountController.text =
            (invoiceDetails['amount_cents'] / 100).toInt().toString();
        _otherapplicableCharges = invoiceDetails['other_charge_applicable'];
        if (_otherapplicableCharges) {
          otherTotalAmountController.text =
              (invoiceDetails['other_charge_cents'] / 100).toInt().toString();
        }
        otherChargeDescriptionController.text =
            invoiceDetails['other_charge_description'] ?? "";
        _AdjustmentApplicable = invoiceDetails['adjustment_applicable'];
        if (_AdjustmentApplicable) {
          adjustmentAmountController.text =
              (invoiceDetails['adjustment_amount_cents'] / 100)
                  .toInt()
                  .toString();
        }
        adjustmentDescriptionController.text =
            invoiceDetails['adjustment_description'] ?? "";
        discountPercentageController.text =
            invoiceDetails['discount_to_subscriber'];
        _ServiceTaxApplicable = invoiceDetails['service_tax_applicable'];
        if (_ServiceTaxApplicable) {
          servicePercentageController.text = invoiceDetails['service_tax_rate'];
        }
        _VATApplicable = invoiceDetails['vat_applicable'];
        if (_VATApplicable) {
          vatPercentageController.text = invoiceDetails['vat_rate'];
        }
        _RoundOffApplicable = invoiceDetails['round_off_applicable'];
        _GSTApplicable = invoiceDetails['gst_applicable'];
        if (_GSTApplicable) {
          gstController.text = invoiceDetails['gst_no'];
          cgstPercentageController.text = invoiceDetails['cgst_rate'];
          sgstPercentageController.text = invoiceDetails['sgst_rate'];
          ugstPercentageController.text = invoiceDetails['ugst_rate'];
          igstPercentageController.text = invoiceDetails['igst_rate'];
        }
        data['subscriber_id'] = widget.invoiceDetails!['subscriber_id'];
        calculateFinalAmount();
      }
    });
  }

  void calculateFinalAmount() {
    double finalAmountResult = double.tryParse(amountController.text) ?? 0;

    if (_otherapplicableCharges == true) {
      finalAmountResult = finalAmountResult +
          (double.tryParse(otherTotalAmountController.text) ?? 0);
    }
    if (_AdjustmentApplicable == true) {
      finalAmountResult -=
          (double.tryParse(adjustmentAmountController.text) ?? 0);
    }

    if (_ServiceTaxApplicable == true) {
      double servicePercentage =
          (double.tryParse(servicePercentageController.text) ?? 0) / 100;
      double serviceAmount = servicePercentage * finalAmountResult;
      finalAmountResult += serviceAmount;
      servicePriceController.text = serviceAmount.toStringAsFixed(2);
    }
    totalAmountBeforeTaxController.text = finalAmountResult.toStringAsFixed(2);
    if (_GSTApplicable == true) {
      double cgstPercentage =
          (double.tryParse(cgstPercentageController.text) ?? 0) / 100;
      double sgstPercentage =
          (double.tryParse(sgstPercentageController.text) ?? 0) / 100;
      double ugstPercentage =
          (double.tryParse(ugstPercentageController.text) ?? 0) / 100;
      double igstPercentage =
          (double.tryParse(igstPercentageController.text) ?? 0) / 100;

      double cgstAmount = cgstPercentage * finalAmountResult;
      double sgstAmount = sgstPercentage * finalAmountResult;
      double ugstAmount = ugstPercentage * finalAmountResult;
      double igstAmount = igstPercentage * finalAmountResult;

      finalAmountResult += cgstAmount + sgstAmount + ugstAmount + igstAmount;

      cgstPriceController.text = cgstAmount.toStringAsFixed(2);
      sgstPriceController.text = sgstAmount.toStringAsFixed(2);
      ugstPriceController.text = ugstAmount.toStringAsFixed(2);
      igstPriceController.text = igstAmount.toStringAsFixed(2);
    }

    if (_VATApplicable == true) {
      double vatPercentage =
          (double.tryParse(vatPercentageController.text) ?? 0) / 100;
      double vatAmount = vatPercentage * finalAmountResult;
      finalAmountResult += vatAmount;
      vatPriceController.text = vatAmount.toStringAsFixed(2);
    }

    double discountPercentage =
        (double.tryParse(discountPercentageController.text) ?? 0) / 100;
    double discountAmount = discountPercentage * finalAmountResult;
    finalAmountResult -= discountAmount;

    setState(() {
      totalAmountController.text = finalAmountResult.toStringAsFixed(2);
      data['amount'] = double.tryParse(amountController.text) ?? 0;
      discountPriceController.text = discountAmount.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    invoiceViewModel = context.watch<InvoiceViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.isEdit ? "Edit Invoice Detail" : "Add Invoice"),
        actions: [],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4))),
        child: invoiceViewModel.isLoading
            ? Container(
                width: 50,
                height: 50,
                child: const Center(child: CircularProgressIndicator()))
            : Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        print(data);
                        if (_formKey.currentState!.validate()) {
                          bool status = widget.isEdit
                              ? await invoiceViewModel.updateInvoice(
                                  widget.invoiceDetails!['id'].toString(), data)
                              : await invoiceViewModel.addInvoice(data);
                          if (status) {
                            if (widget.isEdit) {
                              AppUtils.appToast(
                                  "Invoice Updated Successfully!");
                            } else {
                              AppUtils.appToast("Invoice Added Successfully!");
                            }
                            Navigator.pop(context, true);
                          } else {
                            AppUtils.appToast("${invoiceViewModel.error}");
                          }
                        } else {
                          // AppUtils.appToast("${subscriberViewModel.error}");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
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
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                              data['invoice_no'] = value;
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
                        padding: const EdgeInsets.symmetric(vertical: 5),
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
                              print(
                                  "objectobjectobjectobjectobject $subscriberMap");
                              data['subscriber_id'] =
                                  subscriberMap!['subscribers.id'];
                              return null;
                            }
                          },
                          onTap: widget.isEdit
                              ? null
                              : () async {
                                  showModalBottomSheet(
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
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
                                              subscriberMap![
                                                  'subscribers.name'];
                                        });
                                      });
                                    },
                                  );
                                },
                          decoration: AppUtils.getTextForField(
                                  context, "Select Subscriber")
                              .copyWith(
                                  suffixIcon:
                                      const Icon(Icons.arrow_drop_down))),
                    ],
                  ),
                ),
                true
                    ? Container()
                    : Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Assigned to',
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
                              data['subscriber_id'] = subscriberMap![
                                        'subscribers.subscriberid'];
                                    return null;
                                  }
                          },
                          onTap: () async {
                            showModalBottomSheet(
                              elevation: 2,
                              shape: const RoundedRectangleBorder(
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
                                              subscriberMap![
                                                  'subscribers.name'];
                                        });
                                      });
                                    },
                                  );
                                },
                                decoration: AppUtils.getTextForField(
                                        context, "Select user")
                                    .copyWith(
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down))),
                          ],
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 5),
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
                        data['invoice_date'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration:
                          AppUtils.getTextForField(context, "Invoice Date")
                              .copyWith(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 5),
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
                        data['due_by'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration: AppUtils.getTextForField(context, "Due Date")
                          .copyWith(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
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
                              data['location_package_name'] =
                                  packageSelected!['name'];
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
                                return PackageSingleSelectionBottomSheet(
                                    packageSelected, (selectedItem) {
                                  setState(() {
                                    packageSelected = selectedItem;
                                    packageController.text =
                                        packageSelected!['name'];
                                    amountController.text = (packageSelected![
                                                    'price_to_subscriber_cents'] /
                                                100)
                                            .toString() ??
                                        "";
                                    calculateFinalAmount();
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
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Period From',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: periodFromController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please select period from date";
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
                        periodFromController.text =
                            DateFormat('dd-MMM-yyyy').format(dateTime!);
                        data['period_from'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration:
                          AppUtils.getTextForField(context, "For period Date")
                              .copyWith(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Period to',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: periodToController,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      onTap: () async {
                        DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2100));
                        periodToController.text =
                            DateFormat('dd-MMM-yyyy').format(dateTime!);
                        data['period_to'] =
                            DateFormat('yyy-MM-dd').format(dateTime);
                      },
                      decoration:
                          AppUtils.getTextForField(context, "For period Date")
                              .copyWith(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 5),
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
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          /*validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },*/
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Total Amount")
                              .copyWith(
                            counterText: "",
                            prefixIcon:
                                const Icon(Icons.currency_rupee_outlined),
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                          onChanged: (e) {
                            calculateFinalAmount();
                          },
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
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: (value) {
                            /*if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }*/
                          },
                          decoration:
                              AppUtils.getTextForField(context, "Enter Amount")
                                  .copyWith(
                            counterText: "",
                            prefixIcon:
                                const Icon(Icons.currency_rupee_outlined),
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
                        data['other_charge_applicable'] =
                            _otherapplicableCharges ? 1 : 0;
                      });
                    },
                  ),
                ),
                _otherapplicableCharges == false
                    ? Container()
                    : AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            onChanged: (s) {
                                              calculateFinalAmount();
                                            },
                                            controller:
                                                otherTotalAmountController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: (value) {
                                              if (_otherapplicableCharges &&
                                                  (value!.isEmpty ||
                                                      int.parse(value) < 0)) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['other_charge'] = value;
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Other Charge Amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                otherChargeDescriptionController,
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
                                                data['other_charge_description'] =
                                                    value;
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
                        data['adjustment_applicable'] =
                            _AdjustmentApplicable ? 1 : 0;
                      });
                    },
                  ),
                ),
                _AdjustmentApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                adjustmentAmountController,
                                            onChanged: (e) {
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: (value) {
                                              if (_AdjustmentApplicable &&
                                                  (value!.isEmpty ||
                                                      int.parse(value) < 0)) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['adjustment_amount'] =
                                                    double.parse(value!);
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Adjustment amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                adjustmentDescriptionController,
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
                                                data['adjustment_description'] =
                                                    value;
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
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                          controller: discountPercentageController,
                          onChanged: (e) {
                            calculateFinalAmount();
                          },
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          /*validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['discount_to_subscriber'] = value;
                            }
                          },*/
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Discount to subscriber")
                              .copyWith(
                            counterText: "",
                            prefixIcon:
                                const Icon(Icons.currency_rupee_outlined),
                            suffixIcon: const Icon(Icons.percent),
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                          controller: discountPriceController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          /* validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },*/
                          decoration: AppUtils.getTextForField(context,
                                  "Enter Discount to subscriber amount")
                              .copyWith(
                            counterText: "",
                            prefixIcon:
                                const Icon(Icons.currency_rupee_outlined),
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                          controller: totalAmountBeforeTaxController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          /*validator: (value) {
                            if (value!.isEmpty || int.parse(value) < 0) {
                              return "please enter amount and should be greater than 0";
                            } else {
                              data['amount'] = value;
                            }
                          },*/
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Total amount before tax")
                              .copyWith(
                            counterText: "",
                            prefixIcon:
                                const Icon(Icons.currency_rupee_outlined),
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
                        data['service_tax_applicable'] =
                            _ServiceTaxApplicable ? 1 : 0;
                      });
                    },
                  ),
                ),
                _ServiceTaxApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Service TAX rate',
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
                                            controller:
                                                servicePercentageController,
                                            onChanged: (e) {
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: (value) {
                                              if (_ServiceTaxApplicable &&
                                                  (value!.isEmpty ||
                                                      double.parse(value) <
                                                          0)) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['service_tax_rate'] =
                                                    value;
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Adjustment amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon:
                                                  const Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'Service TAX amount',
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
                                            controller: servicePriceController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter Service TAX amount")
                                                .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
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
                        data['gst_applicable'] = _GSTApplicable ? 1 : 0;
                      });
                    },
                  ),
                ),
                _GSTApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: gstController,
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
                                                data['gst_no'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                    context, "Enter GST#"),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                cgstPercentageController,
                                            onChanged: (e) {
                                              data['cgst_rate'] = e;
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter CGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon:
                                                  const Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: cgstPriceController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter CGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                sgstPercentageController,
                                            onChanged: (e) {
                                              data['sgst_rate'] = e;
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter SGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon:
                                                  const Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: sgstPriceController,
                                            /*onChanged: (e){
                                        calculateFinalAmount();
                                      },*/
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter SGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                ugstPercentageController,
                                            onChanged: (e) {
                                              data['ugst_rate'] = e;
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter UGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon:
                                                  const Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: ugstPriceController,
                                            /*onChanged: (e){
                                        calculateFinalAmount();
                                      },*/
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter UGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller:
                                                igstPercentageController,
                                            onChanged: (e) {
                                              data['igst_rate'] = e;
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter IGST Rate")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
                                                  .currency_rupee_outlined),
                                              suffixIcon:
                                                  const Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: igstPriceController,
                                            /* onChanged: (e){
                                        calculateFinalAmount();
                                      },*/
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter IGST Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
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
                        data['vat_applicable'] = _VATApplicable ? 1 : 0;
                      });
                    },
                  ),
                ),
                _VATApplicable == false
                    ? Container()
                    : AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: vatPercentageController,
                                            onChanged: (e) {
                                              calculateFinalAmount();
                                            },
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: (value) {
                                              if (_VATApplicable &&
                                                  (value!.isEmpty ||
                                                      double.parse(value) <
                                                          0)) {
                                                return "please enter amount and should be greater than 0";
                                              } else {
                                                data['vat_rate'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter VAT Rate")
                                                    .copyWith(
                                              counterText: "",
                                              suffixIcon:
                                                  const Icon(Icons.percent),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.symmetric(
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
                                            controller: vatPriceController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 5,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            /*validator: (value) {
                                        if (value!.isEmpty ||
                                            int.parse(value) < 0) {
                                          return "please enter amount and should be greater than 0";
                                        } else {
                                          data['amount'] = value;
                                        }
                                      },*/
                                            decoration:
                                                AppUtils.getTextForField(
                                                        context,
                                                        "Enter VAT Amount")
                                                    .copyWith(
                                              counterText: "",
                                              prefixIcon: const Icon(Icons
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
                        data['round_off_applicable'] =
                            _RoundOffApplicable ? 1 : 0;
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
