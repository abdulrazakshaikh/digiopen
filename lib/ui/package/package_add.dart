import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/AppUtils.dart';
import '../../view_model/package_view_model.dart';

class PackageAdd extends StatefulWidget {
  final bool isEdit;
  final Map? packageDetaill;
  final onChange;

  const PackageAdd(
      {Key? key,
      this.isEdit = false,
      this.packageDetaill = null,
      this.onChange = null})
      : super(key: key);

  @override
  State<PackageAdd> createState() => _PackageAddState();
}

class _PackageAddState extends State<PackageAdd> {
  late PackageViewModel packageViewModel;
  final _validityList = [
    "Hour/s",
    "Day/s",
    "Week/s",
    "Month/s",
    "Year/s",
  ];
  final _packageList = [
    "None",
    "Commercial",
    "Residential",
    "Fiber",
    "Wireless",
  ];
  final _SpeedList = [
    "Kbps",
    "Mbps",
  ];
  String? selectedPackage = "None";
  String? selectedValidity = "Month/s";
  String? selectedUploadSpeed = "Mbps";
  String? selectedDownalodSpeed = "Mbps";

  bool _noChargeTax = true;
  bool _availableHotspotSubscribers = false;
  bool _availableOnlinePayment = false;
  bool _bindIpPool = false;
  bool _roundOff = false;
  Map data = {};
  TextEditingController nameController = TextEditingController();
  TextEditingController validityController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  TextEditingController downloadController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController advURLController = TextEditingController();
  TextEditingController advIntervalController = TextEditingController();
  TextEditingController ipPoolController = TextEditingController();
  TextEditingController fupIPPoolController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEdit) {
      nameController.text = widget.packageDetaill!['name'] ?? "";
      validityController.text =
          widget.packageDetaill!['valid_for'].toString() ?? "";
      uploadController.text =
          widget.packageDetaill!['bandwidth_up'].toString() ?? "";
      downloadController.text =
          widget.packageDetaill!['bandwidth_down'].toString() ?? "";
      priceController.text =
          (widget.packageDetaill!['price_to_subscriber_cents'] / 100)
                  .toString() ??
              "";
      advURLController.text = widget.packageDetaill!['advertisement_url'] ?? "";
      advIntervalController.text =
          widget.packageDetaill!['advertisement_interval'] ?? "10";
      ipPoolController.text = widget.packageDetaill!['ip_pool_name'] ?? "";
      fupIPPoolController.text =
          widget.packageDetaill!['fup_ip_pool_name'] ?? "";
      _noChargeTax = widget.packageDetaill!['do_not_charge_tax'];
      _availableHotspotSubscribers =
          widget.packageDetaill!['available_for_hotspot_subscribers'];
      _availableOnlinePayment =
          widget.packageDetaill!['available_for_online_payment'];
      _bindIpPool = widget.packageDetaill!['bind_ip_pool'];
      _roundOff = widget.packageDetaill!['round_off_applicable'];
      selectedPackage = widget.packageDetaill!['package_type'];
    } else {
      data['validity_unit'] = 'month';
      data['package_type'] = selectedPackage;
      data['do_not_charge_tax'] = _noChargeTax ? "1" : "0";
      data['round_off_applicable'] = _roundOff ? "1" : "0";
      data['available_for_hotspot_subscribers'] =
          _availableHotspotSubscribers ? "1" : "0";
      data['available_for_online_payment'] =
          _availableOnlinePayment ? "1" : "0";
      data['bind_ip_pool'] = _bindIpPool ? "1" : "0";
    }
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    packageViewModel = context.watch<PackageViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.isEdit ? 'Update Package' : "Add Package"),
        actions: [],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4))),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_availableHotspotSubscribers) {
                      if ((advIntervalController.text.isEmpty ||
                          data['advertisement_url'].isEmpty)) {
                        data['available_for_hotspot_subscribers'] = "0";
                        data.remove("advertisement_url");
                        data.remove("advertisement_interval");
                      }
                    }

                    bool status = widget.isEdit
                        ? await packageViewModel.updatePackage(
                            widget.packageDetaill!['id'].toString(), data)
                        : await packageViewModel.addPackage(data);
                    if (status) {
                      if (widget.isEdit) {
                        AppUtils.appToast("Package Updated Successfully!");
                      } else {
                        AppUtils.appToast("Package Added Successfully!");
                      }
                      if (widget.onChange != null) {
                        widget.onChange();
                      }
                      Navigator.pop(context, true);
                    } else {
                      AppUtils.appToast("${packageViewModel.error}");
                    }
                  } else {
                    // AppUtils.appToast("${subscriberViewModel.error}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                ),
                child: Text(widget.isEdit ? "Update" : "Create"),
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
                            ' Name',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: nameController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter package name";
                            } else {
                              data['name'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter Package Name"),
                        ),
                      ],
                    )),

                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Valid for',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: validityController,
                                style: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter valid for";
                                  } else {
                                    data['valid_for'] = value;
                                  }
                                },
                                decoration: AppUtils.getTextForField(
                                    context, "enter valid for"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: DropdownButtonFormField(
                                  value: selectedValidity,
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
                                    hintText: 'Validity Type'.toLowerCase(),
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
                                  items: _validityList.map((String value) {
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
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValidity = newValue!;
                                      if (newValue == _validityList[0]) {
                                        data['validity_unit'] = "hour";
                                      } else if (newValue == _validityList[1]) {
                                        data['validity_unit'] = "day";
                                      } else if (newValue == _validityList[2]) {
                                        data['validity_unit'] = "week";
                                      } else if (newValue == _validityList[3]) {
                                        data['validity_unit'] = "month";
                                      } else if (newValue == _validityList[4]) {
                                        data['validity_unit'] = "year";
                                      }
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Bandwidth (Upload)',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: uploadController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                style: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty || value == "0") {
                                    return "Should be greater than 1";
                                  } else {
                                    data['bandwidth_up'] = value;
                                    data['bandwidth_up_unit'] =
                                        selectedUploadSpeed == "Kbps"
                                            ? "k"
                                            : "M";
                                  }
                                },
                                decoration: AppUtils.getTextForField(
                                    context, "Enter Speed"),
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
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    hintText: 'Speed Type'.toLowerCase(),
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
                                  items: _SpeedList.map((String value) {
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
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedUploadSpeed = newValue!;
                                      data['bandwidth_up_unit'] =
                                          newValue == "Kbps" ? "k" : "M";
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Bandwidth (Download)',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: downloadController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                style: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty || value == "0") {
                                    return "Should be greater than 1";
                                  } else {
                                    data['bandwidth_down'] = value;
                                    data['bandwidth_down_unit'] =
                                        selectedDownalodSpeed == "Kbps"
                                            ? "k"
                                            : "M";
                                  }
                                },
                                decoration: AppUtils.getTextForField(
                                    context, "Enter speed"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: DropdownButtonFormField(
                                  value: selectedDownalodSpeed,
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
                                    hintText: 'Speed Type'.toLowerCase(),
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
                                  items: _SpeedList.map((String value) {
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
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      data['bandwidth_down_unit'] =
                                          newValue == "Kbps" ? "k" : "M";
                                      selectedDownalodSpeed = newValue!;
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
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Package Type ',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: selectedPackage,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Select Package Type'.toLowerCase(),
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
                        items: _packageList.map((String value) {
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
                            selectedPackage = newValue!;
                            data['package_type'] = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                // Container(
                //     margin: EdgeInsets.only(bottom: 10),
                //     child: Column(
                //       children: [

                //         Container(
                //           alignment: Alignment.topLeft,
                //           padding: EdgeInsets.symmetric(vertical: 5),
                //           child: Text('Description',
                //             style: GoogleFonts.robotoCondensed(
                //               textStyle: Theme.of(context).textTheme.labelLarge,
                //               letterSpacing: 1.75,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ),

                //         TextField(
                //           style: GoogleFonts.roboto(
                //             textStyle: Theme.of(context).textTheme.bodyMedium,
                //             fontWeight: FontWeight.w600,
                //             letterSpacing: 1.2,
                //           ),
                //           maxLines: 4,
                //           decoration: InputDecoration(
                //             floatingLabelBehavior: FloatingLabelBehavior.never,
                //             hintText: 'Enter Description'.toLowerCase(),
                //             hintStyle: GoogleFonts.roboto(
                //                 textStyle: Theme.of(context).textTheme.bodyMedium,
                //                 letterSpacing: 1.8,
                //                 fontWeight: FontWeight.w300),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                //             ),
                //           ),
                //         ),
                //       ],
                //     )
                // ),

                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Price to subscriber',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: priceController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter price to subscriber";
                            } else {
                              data['price_to_subscriber'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                                  context, 'Enter Price'.toLowerCase())
                              .copyWith(
                            prefixIcon: Icon(Icons.currency_rupee_outlined),
                          ),
                        ),
                      ],
                    )),

                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Do Not Charge Tax',
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
                    value: _noChargeTax,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _noChargeTax = value!;
                        data['do_not_charge_tax'] = value ? "1" : "0";
                      });
                    },
                  ),
                ),

                _noChargeTax == true
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
                                    child: CheckboxListTile(
                                      title: Text(
                                        'Roundoff Applicable',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      dense: true,
                                      contentPadding: EdgeInsets.zero,
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: _roundOff,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _roundOff = value!;
                                          data['round_off_applicable'] =
                                              value ? "1" : "0";
                                        });
                                      },
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
                                          'Price to Subscriber After Tax',
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
                                        initialValue: "0.0",
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                        decoration: AppUtils.getTextForField(
                                            context,
                                            "Enter Price ".toLowerCase()),
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
                      'Available for Hotspot Subscribers',
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
                    value: _availableHotspotSubscribers,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _availableHotspotSubscribers = value!;
                        data['available_for_hotspot_subscribers'] =
                            value ? "1" : "0";
                      });
                    },
                  ),
                ),
                _availableHotspotSubscribers == false
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
                                              'Advertisement URL',
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
                                            controller: advURLController,
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            validator: (value) {
                                              /* if (value!.isEmpty) {
                                                return null;
                                              } else {
                                                data['advertisement_url'] =
                                                    value;
                                              }*/
                                              data['advertisement_url'] = value;
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                    context, "Enter URL"),
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
                                              'Advertisement Interval',
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
                                            controller: advIntervalController,
                                            validator: (value) {
                                              /*if (value!.isEmpty) {
                                                return null;
                                              } else {
                                                data['advertisement_interval'] =
                                                    value;
                                              }*/
                                              data['advertisement_interval'] =
                                                  value;
                                            },
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                            maxLength: 2,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                hintText: 'Enter Interval'
                                                    .toLowerCase(),
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      width: 1),
                                                ),
                                                suffix: Text(
                                                  'Seconds'.toLowerCase(),
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          letterSpacing: 1.2,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                                counterText: ""),
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
                      'Available for Online Payment',
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
                    value: _availableOnlinePayment,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _availableOnlinePayment = value!;
                        data['available_for_online_payment'] =
                            value ? "1" : "0";
                      });
                    },
                  ),
                ),

                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Bind IP',
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
                    value: _bindIpPool,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _bindIpPool = value!;
                        data['bind_ip_pool'] = value ? "1" : "0";
                      });
                    },
                  ),
                ),

                _bindIpPool == false
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
                                              'IP Pool Name',
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
                                            controller: ipPoolController,
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
                                                data['ip_pool_name'] = value;
                                              }
                                            },
                                            decoration:
                                                AppUtils.getTextForField(
                                                    context,
                                                    "Enter IP pool name"),
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
                                              'FUP IP Pool Name',
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
                                            controller: fupIPPoolController,
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
                                                data['fup_ip_pool_name'] =
                                                    value;
                                              }
                                            },
                                            decoration: AppUtils.getTextForField(
                                                    context,
                                                    "Enter FUP IP pool name")
                                                .copyWith(
                                              helperText: 'Must Exist in Router'
                                                  .toLowerCase(),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
