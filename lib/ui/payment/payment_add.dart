import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentAdd extends StatefulWidget {
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
    "Cash",
    "Cheque",
    "Debit Card",
    "Credit Card",
    "Net Banking",
    "Online Payment",
    "Other"
  ];

  var selectedSubscriber = null;
  var selectedPaymentMode = null;
  var selectedReceiver = null;
  var _receivedByMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Payment"),
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
                  Navigator.pop(context);
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
      body: ListView(
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
                      'Payment#',
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
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Enter Payment#'.toLowerCase(),
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
                DropdownButtonFormField(
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintText: 'Select Subscriber'.toLowerCase(),
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
                  items: subscriberList.map((String value) {
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
                      selectedSubscriber = newValue!;
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
                  'Payment Date',
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
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Payment Date'.toLowerCase(),
                  hintStyle: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w300),
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary, width: 1),
                  ),
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
              TextField(
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
                maxLines: 4,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Enter Description'.toLowerCase(),
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
                        color: Theme.of(context).colorScheme.primary, width: 1),
                  ),
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
                  TextField(
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Enter Amount'.toLowerCase(),
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
                      selectedPaymentMode = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          selectedPaymentMode == null || selectedPaymentMode != "Cheque"
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
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'Check No',
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
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
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      hintText: 'Check no'.toLowerCase(),
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
                                      child: Text('Check Date',
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
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                        hintText: 'Check Date'.toLowerCase(),
                                        hintStyle: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            letterSpacing: 1.8,
                                            fontWeight: FontWeight.w300),

                                        suffixIcon: Icon(Icons.calendar_month_outlined),

                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.symmetric(vertical: 5),
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
                                  TextField(
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.bodyMedium,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      hintText: 'Check issued by bank'.toLowerCase(),
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
                  TextField(
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Receipt#'.toLowerCase(),
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
                  ),
                ],
              )),
          Container(
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
                                    padding: EdgeInsets.symmetric(vertical: 5),
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
                                  DropdownButtonFormField(
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
                                      hintText: 'Received by'.toLowerCase(),
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
                                    items: subscriberList.map((String value) {
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
                                        selectedReceiver = newValue!;
                                      });
                                    },
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
                  TextField(
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
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
