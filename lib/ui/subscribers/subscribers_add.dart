import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/utils/AppUtils.dart';
import 'package:xceednet/view_model/utils_view_model.dart';

import '../../utils/country_bottomsheet.dart';
import '../../view_model/subscriber_view_model.dart';

class SubscribersAdd extends StatefulWidget {
  const SubscribersAdd(
      {Key? key,
      required this.title,
      this.isEdit = false,
      this.subscriberDetails = null})
      : super(key: key);

  final String title;
  final bool isEdit;
  final Map? subscriberDetails;

  @override
  State<SubscribersAdd> createState() => _SubscribersAddState();
}

class _SubscribersAddState extends State<SubscribersAdd> {
  var _subscriberstype = [
    "None",
    "Commercial",
    "Residential",
    "Fiber",
    "Wireless",
  ];
  bool alterNativeAddress = false;
  var subscribersType = "None";
  var allowDevices = '1';

  var _autorenewfor = [
    "Indefinately",
    "1 Times",
    "2 Times",
    "3 Times",
    "4 Times",
    "5 Times",
    "6 Times",
    "7 Times",
    "8 Times",
    "9 Times",
    "10 Times",
    "11 Times",
    "12 Times",
    "13 Times",
    "14 Times",
    "15 Times",
    "16 Times",
    "17 Times",
    "18 Times",
    "19 Times",
    "20 Times",
    "21 Times",
    "22 Times",
    "23 Times",
    "24 Times",
  ];

  var autoRenewFor = 'Indefinately';

  bool isCheckedStickyPassword = false;
  bool isBlocked = false;
  bool isCheckedAutoRenew = false;
  var _formKey = GlobalKey<FormState>();
  Map data = {};
  late SubscriberViewModel subscriberViewModel;
  late UtilsViewModel utilsViewModel;
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController gstNoController = TextEditingController();
  TextEditingController aadhaarNoController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  Map? countryMap;

  @override
  void initState() {
    if (widget.isEdit) {
      countryMap = AppUtils.countries
          .where((element) =>
              element['name'] == widget.subscriberDetails!["country"] ||
              element['iso2'] == widget.subscriberDetails!["country"])
          .firstOrNull;
      countryController.text = countryMap!['name'];
      stateController.text = widget.subscriberDetails!["state"] ?? "";
      cityController.text = widget.subscriberDetails!["city"] ?? "";
      accountNoController.text = widget.subscriberDetails!["account_no"] ?? "";
      fullNameController.text = widget.subscriberDetails!["name"] ?? "";
      mobileController.text = widget.subscriberDetails!["mobile1"] ?? "";
      emailController.text = widget.subscriberDetails!["email"] ?? "";
      usernameController.text = widget.subscriberDetails!["username"] ?? "";
      phoneNumberController.text = widget.subscriberDetails!["phone1"] ?? "";
      address1Controller.text = widget.subscriberDetails!["address1"] ?? "";
      address2Controller.text = widget.subscriberDetails!["address2"] ?? "";
      if (widget.subscriberDetails!['address2'] != null &&
          widget.subscriberDetails!['address2'].toString().isNotEmpty) {
        alterNativeAddress = true;
      }
      discountController.text = widget.subscriberDetails!["discount"] ?? "";
      gstNoController.text = widget.subscriberDetails!["gst_no"] ?? "";
      aadhaarNoController.text = widget.subscriberDetails!["aadhar_no"] ?? "";
      noteController.text = widget.subscriberDetails!["note"] ?? "";
      isBlocked = widget.subscriberDetails!['blocked'] ?? false;
      isCheckedStickyPassword =
          widget.subscriberDetails!['sticky_password'] ?? false;
      isCheckedAutoRenew = widget.subscriberDetails!['auto_renew'] ?? false;
      if (isCheckedAutoRenew) {
        if (widget.subscriberDetails!['auto_renew_for'].toString() == "0") {
          autoRenewFor = "Indefinately";
        } else
          autoRenewFor =
              widget.subscriberDetails!['auto_renew_for'].toString() ??
                  "Indefinately";
        data['auto_renew'] = "true";
        data['auto_renew_for'] = autoRenewFor;
        if (autoRenewFor.toUpperCase() != "Indefinately".toUpperCase()) {
          autoRenewFor = autoRenewFor + " Times";
        }
      }

      subscribersType = widget.subscriberDetails!['subscriber_type'] ?? "";
      allowDevices =
          widget.subscriberDetails!['allow_devices'].toString() ?? "1";
      pinController.text = widget.subscriberDetails!['zip'].toString() ?? "1";
    }
  }

  @override
  Widget build(BuildContext context) {
    subscriberViewModel = context.watch<SubscriberViewModel>();
    utilsViewModel = context.watch<UtilsViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.title.toUpperCase()),
        actions: [],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4))),
        child: subscriberViewModel.isLoading
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
                              ? await subscriberViewModel.updateSubscriber(
                                  widget.subscriberDetails!['id'].toString(),
                                  data)
                              : await subscriberViewModel.addSubscriber(data);
                          if (status) {
                            if (widget.isEdit) {
                              AppUtils.appToast(
                                  "Subscriber Updated Successfully!");
                            } else {
                              AppUtils.appToast(
                                  "Subscriber Added Successfully!");
                            }
                            Navigator.pop(context, true);
                          } else {
                            AppUtils.appToast("${subscriberViewModel.error}");
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
                      child: Text(widget.isEdit ? 'Update' : 'Create'),
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
                            'Account Number',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: accountNoController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['account_no'] = value;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter Account No."),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
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
                                    'Full Name',
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
                                  controller: fullNameController,
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter Name".toLowerCase();
                                    } else {
                                      data['name'] = value;
                                      return null;
                                    }
                                  },
                                  decoration: AppUtils.getTextForField(
                                      context, "Enter Full Name"),
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
                                    'Mobile',
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
                                  controller: mobileController,
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  maxLength: 15,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 10) {
                                      return "Please enter valid mobile";
                                    } else {
                                      data['mobile1'] = value;
                                      return null;
                                    }
                                  },
                                  decoration: AppUtils.getTextForField(
                                          context, "Enter Mobile Number")
                                      .copyWith(counterText: ""),
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
                                    'Email',
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
                                  controller: emailController,
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        AppUtils.validateEmail(value) != null) {
                                      return "Please enter valid email";
                                    } else {
                                      data['email'] = value;
                                      return null;
                                    }
                                  },
                                  decoration: AppUtils.getTextForField(
                                      context, "Enter Email"),
                                ),
                              ],
                            )),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Username',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 2) {
                              return "Should be at least of length 2 characters, "
                                  "Please enter Username, Invalid Username. "
                                  "Should contain combination of letters, digits, "
                                  "dots, @, hyphens, round brackets or underscores.";
                            } else {
                              data['username'] = value;
                              return null;
                            }
                          },
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          decoration: AppUtils.getTextForField(
                              context, "Enter Username"),
                        ),
                      ],
                    )),
                widget.isEdit
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Password',
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  letterSpacing: 1.75,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              obscureText: true,
                              decoration: AppUtils.getTextForField(
                                  context, "Enter Password"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Should be at least of length 3 characters, Password cannot be blank";
                                } else {
                                  data['password'] = value;
                                  return null;
                                }
                              },
                            ),
                          ],
                        )),
                widget.isEdit
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Confirm Password',
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  letterSpacing: 1.75,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Should be at least of length 3 characters, Password cannot be blank";
                                } else {
                                  if (data['password'] == value) {
                                    data['password_confirmation'] = value;
                                    return null;
                                  } else {
                                    return "Password and confirm password should be same!";
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: AppUtils.getTextForField(
                                  context, "Enter Confirm password"),
                            ),
                          ],
                        )),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Blocked',
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
                    value: isBlocked,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        isBlocked = value!;
                        data['blocked'] = value ? "1" : "0";
                        // data['sticky_password']=isCheckedStickyPassword;
                      });
                    },
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    title: Text(
                      'Sticky Password',
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
                    value: isCheckedStickyPassword,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedStickyPassword = value!;
                        data['sticky_password'] = value ? "1" : "0";
                        // data['sticky_password']=isCheckedStickyPassword;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CheckboxListTile(
                    title: Text(
                      'Auto Renew',
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
                    value: isCheckedAutoRenew,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        data['auto_renew'] = value! ? "1" : "0";
                        isCheckedAutoRenew = value!;
                      });
                    },
                  ),
                ),
                isCheckedAutoRenew == true
                    ? Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Auto Renew For',
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  letterSpacing: 1.75,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            DropdownButtonFormField(
                              value: autoRenewFor,
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
                                hintText: 'Select Auto Renew For'.toLowerCase(),
                                hintStyle: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                              ),
                              items: _autorenewfor.map((String value) {
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
                                  autoRenewFor = newValue!;
                                  data['auto_renew_for'] =
                                      newValue.replaceAll("Times", "");
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Divider(height: 30),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Phone Number',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: phoneNumberController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['phone1'] = value;
                              return null;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter Phone Number"),
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
                        'Address Line',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: address1Controller,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Address Line 1";
                        } else {
                          data['address1'] = value;
                          return null;
                        }
                      },
                      maxLines: 4,
                      decoration: AppUtils.getTextForField(
                          context, "Enter Address Line"),
                    ),
                  ],
                )),
                !alterNativeAddress
                    ? GestureDetector(
                        onTap: () {
                          alterNativeAddress = true;
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            '+ Add alternative',
                            style: GoogleFonts.robotoCondensed(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue),
                          ),
                        ),
                      )
                    : Container(
                        child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Address Line 2',
                              style: GoogleFonts.robotoCondensed(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: address2Controller,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              } else {
                                data['address2'] = value;
                                return null;
                              }
                            },
                            maxLines: 4,
                            decoration: AppUtils.getTextForField(
                                context, "Enter Address Line"),
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
                            'Pincode',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: pinController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          maxLength: 6,
                          /*onChanged: (v) async {
                            if (v.length >= 4 && !widget.isEdit) {
                              bool status =
                                  await utilsViewModel.getAddressViaPin(v);
                              if (status) {
                                print(utilsViewModel.addressDetail);
                                countryController.text =
                                    utilsViewModel.addressDetail!['Country'];
                                stateController.text =
                                    utilsViewModel.addressDetail!['State'];
                                cityController.text =
                                    utilsViewModel.addressDetail!['Division'];
                                setState(() {});
                              } else {
                                countryController.text = "";
                                stateController.text = "";
                                AppUtils.appToast(
                                    "Please enter valid pin code ");
                              }
                            } else {
                              countryController.text = "";
                              stateController.text = "";
                            }
                          },*/
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter zip/pin code ";
                            } else {
                              data['zip'] = value;
                              return null;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Pincode")
                              .copyWith(
                                  counterText: "",
                                  suffix: utilsViewModel.isLoading
                                      ? Container(
                                          width: 20,
                                          height: 20,
                                          margin: EdgeInsets.only(right: 10),
                                          child: CircularProgressIndicator())
                                      : null),
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
                          'Country',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextFormField(
                          readOnly: true,
                          controller: countryController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please select country";
                            } else {
                              data['country'] = countryMap!['iso2'];
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
                                      return CountrySingleSelectionBottomSheet(
                                          countryMap, (selectedItem) {
                                        setState(() {
                                          countryMap = selectedItem;
                                          countryController.text =
                                              countryMap!['name'];
                                        });
                                      });
                                    },
                                  );
                                },
                          decoration: AppUtils.getTextForField(
                                  context, "Select Country")
                              .copyWith(
                                  suffixIcon:
                                      const Icon(Icons.arrow_drop_down))),
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
                            'State',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: stateController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter state ";
                            } else {
                              data['state'] = value;
                            }
                          },
                          decoration:
                              AppUtils.getTextForField(context, "Select State"),
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
                            'City',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: cityController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['city'] = value;
                              return null;
                            }
                          },
                          decoration:
                              AppUtils.getTextForField(context, "Enter City"),
                        ),
                      ],
                    )),
                Divider(height: 30),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Subscribers Type',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: subscribersType,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: AppUtils.getTextForField(
                            context, "Select Subscribers Type"),
                        items: _subscriberstype.map((String value) {
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
                            subscribersType = newValue!;
                            data['subscriber_type'] = subscribersType;
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
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Allow devices',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: allowDevices,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: AppUtils.getTextForField(
                            context, "Select Allow devices"),
                        items: ['1'].map((String value) {
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
                            allowDevices = newValue!;
                            data['allow_devices'] = newValue;
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
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Discount(%)',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: discountController,
                          maxLength: 2,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // Only numbers can be entered
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['discount'] = value;
                              return null;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                                  context, "Enter Discount")
                              .copyWith(counterText: ""),
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
                            'GST Number',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: gstNoController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['gst_no'] = value;
                              return null;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter GST Number"),
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
                            'Aadhaar Number',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: aadhaarNoController,
                          maxLength: 12,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // Only
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['aadhar_no'] = value;
                              return null;
                            }
                          },
                          decoration: AppUtils.getTextForField(
                              context, "Enter Aadhaar Number"),
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
                            'Note',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: noteController,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else {
                              data['note'] = value;
                              return null;
                            }
                          },
                          maxLines: 4,
                          decoration:
                              AppUtils.getTextForField(context, "Enter Notes"),
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
