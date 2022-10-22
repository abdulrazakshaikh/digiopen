import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';

class InvoiceAdd extends StatefulWidget {

  @override
  State<InvoiceAdd> createState() => _InvoiceAddState();
}

class _InvoiceAddState extends State<InvoiceAdd> {
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


  var _otherapplicablecharges = false;
  var _adjustmentapplicable = false;
  var _servicetaxapplicable = false;
  var _gstapplicable = false;
  var _vatapplicable = false;
  var _roundoffapplicable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Invoice"),
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
                onPressed: () {},
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
                    'Invoice#',
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
                    hintText: 'Enter Invoice #'.toLowerCase(),
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
            )
          ),
          
          
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Assigned To',
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
                    hintText: 'Select User'.toLowerCase(),
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
            margin: EdgeInsets.only(bottom: 10),
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
                    hintText: 'Select Date'.toLowerCase(),
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
            )
          ),
          
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
                    hintText: 'Select Date'.toLowerCase(),
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
            )
          ),
          
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
                DropdownButtonFormField(
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
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'For Period',
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
                    hintText: 'Select Date'.toLowerCase(),
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
            )
          ),
          
          
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
            )
          ),



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
                TextField(
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: '0'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    enabled: false,
                    prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                  ),
                ),
              ],
            )
          ),

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
                    hintText: '0'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                    prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                  ),
                ),
              ],
            )
          ),


          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Discount to Subscriber',
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
                    hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                    suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                  ),
                ),
              ],
            )
          ),

          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Discount to Subscriber Amount',
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
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: '0'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    enabled: false,
                    prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                  ),
                ),
              ],
            )
          ),

          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Total Amount Before Tax',
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
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: '0'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    enabled: false,
                    prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                  ),
                ),
              ],
            )
          ),

          


          Container(
            child: CheckboxListTile(
              title: Text(
                'Other Applicable Charges',
                style: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600, letterSpacing: 1.2,),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _otherapplicablecharges,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _otherapplicablecharges = value!;
                });
              },
            ),
          ),
          _otherapplicablecharges == false ? Container() : 
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide( color: Theme.of(context).dividerColor)),
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
                              'Other Charge',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
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
                              'Other Charge Description',
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
                      )
                    ),
                    
                    
                  
                  ],
                ),
              )
            ),
          ),


          Container(
            child: CheckboxListTile(
              title: Text(
                'Adjustment Applicable',
                style: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600, letterSpacing: 1.2,),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _adjustmentapplicable,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _adjustmentapplicable = value!;
                });
              },
            ),
          ),
          _adjustmentapplicable == false ? Container() : 
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide( color: Theme.of(context).dividerColor)),
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
                              'Adjustment Amount',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
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
                              'Adjustment Description',
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
                      )
                    ),
                  
                  ],
                ),
              )
            ),
          ),


          Container(
            child: CheckboxListTile(
              title: Text(
                'Service Tax Applicable',
                style: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600, letterSpacing: 1.2,),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _servicetaxapplicable,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _servicetaxapplicable = value!;
                });
              },
            ),
          ),
          _servicetaxapplicable == false ? Container() : 
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide( color: Theme.of(context).dividerColor)),
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
                              'Servie Tax Rate',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Service Tax Amount',
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
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              enabled: false,
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                  
                  ],
                ),
              )
            ),
          ),

          Container(
            child: CheckboxListTile(
              title: Text(
                'GST Applicable',
                style: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600, letterSpacing: 1.2,),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _gstapplicable,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _gstapplicable = value!;
                });
              },
            ),
          ),
          _gstapplicable == false ? Container() : 
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide( color: Theme.of(context).dividerColor)),
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
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'Enter GST Number'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'CGST Rate',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'CGST Amount',
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
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              enabled: false,
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),


                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'SCGST Rate',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'SCGST Amount',
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
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              enabled: false,
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'UGST Rate',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'UGST Amount',
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
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              enabled: false,
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'IGST Rate',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'IGST Amount',
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
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              enabled: false,
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),
                  
                  ],
                ),
              )
            ),
          ),



          Container(
            child: CheckboxListTile(
              title: Text(
                'VAT Applicable',
                style: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600, letterSpacing: 1.2,),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _vatapplicable,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _vatapplicable = value!;
                });
              },
            ),
          ),
          _vatapplicable == false ? Container() : 
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide( color: Theme.of(context).dividerColor)),
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
                              'VAT Rate',
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
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1)),
                              suffixIcon: Icon(Icons.percent_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'VAT Amount',
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
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: '0'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium,letterSpacing: 1.8, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                              enabled: false,
                              prefixIcon: Icon(Icons.currency_rupee_outlined, size: 18,),
                            ),
                          ),
                        ],
                      )
                    ),
                  
                  ],
                ),
              )
            ),
          ),



          Container(
            child: CheckboxListTile(
              title: Text(
                'Round Off Applicable',
                style: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600, letterSpacing: 1.2,),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _roundoffapplicable,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _roundoffapplicable = value!;
                });
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
