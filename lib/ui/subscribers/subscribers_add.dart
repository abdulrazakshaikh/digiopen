import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/ui/subscribers/subscribers_list.dart';
import 'package:xceednet/utils/AppUtils.dart';

class SubscribersAdd extends StatefulWidget {
  const SubscribersAdd({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SubscribersAdd> createState() => _SubscribersAddState();
}

class _SubscribersAddState extends State<SubscribersAdd> {
  var _subscriberstype = [
    "Commercial",
    "Residential",
    "Fiber",
    "Wireless",
  ];

  var subscribersType = '';

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

  var autoRenewFor = '';

  bool isCheckedStickyPassword = false;
  bool isCheckedAutoRenew = false;
  var _formKey = GlobalKey<FormState>();
  Map data = {};

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SubscribersList(),
                        ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                ),
                child: Text('Create'),
              ),
            )
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(15),
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
                      decoration:
                          AppUtils.getTextForField(context, "Enter Username"),
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
                        'Password',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      obscureText: true,
                      decoration:
                          AppUtils.getTextForField(context, "Enter Password"),
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
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Confirm Password',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Should be at least of length 3 characters, Password cannot be blank";
                        } else {
                          if (data['password'] == value) {
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
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        DropdownButtonFormField(
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            hintText: 'Select Auto Renew For'.toLowerCase(),
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
                          items: _autorenewfor.map((String value) {
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
                              autoRenewFor = newValue!;
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
                        'Full Name',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Enter Full Name"),
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
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration: AppUtils.getTextForField(
                          context, "Enter Mobile Number"),
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
                        'Phone Number',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration: AppUtils.getTextForField(
                          context, "Enter Phone Number"),
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
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Enter Email"),
                    ),
                  ],
                )),
            Divider(height: 30),
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
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  maxLines: 4,
                  decoration:
                      AppUtils.getTextForField(context, "Enter Address Line"),
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
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Enter Pincode"),
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
                        'Country',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Select Country"),
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
                        'State',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
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
                    TextField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Enter State"),
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
                            textStyle: Theme.of(context).textTheme.bodyMedium,
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
                        'Discount',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          letterSpacing: 1.75,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Enter Discount"),
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
                    TextField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration:
                          AppUtils.getTextForField(context, "Enter GST Number"),
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
                    TextField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      maxLines: 4,
                      decoration:
                          AppUtils.getTextForField(context, "Enter Notes"),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
