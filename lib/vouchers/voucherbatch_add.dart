import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';

class VoucherBatchAdd extends StatefulWidget {

  @override
  State<VoucherBatchAdd> createState() => _VoucherBatchAddState();
}

class _VoucherBatchAddState extends State<VoucherBatchAdd> {
  var _packageList = [
    "Package 1",
    "Package 2",
    "Package 3",
    "Package 4",
  ];
  var _validityList = [
    "Hour/s",
    "Day/s",
    "Week/s",
    "Month/s",
    "Year/s",
  ];
  String? selectedPackage=null;
  String? selectedValidity=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Voucher Batch"),
        actions: [],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4)
          )
        ),
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
                  child: Text('For Package ',
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
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                    ),
                  ),
                  items: _packageList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    );
                  }).toList(),
                  focusColor: Colors.white,
                  onChanged: (String? newValue){
                    setState(() {
                      selectedPackage = newValue!;
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
                  child: Text('Number of Vouchers',
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
                    hintText: 'Enter Number of Vouchers'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w300),
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
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Voucher Type',
                  style: GoogleFonts.robotoCondensed(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    letterSpacing: 1.75,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ),
                TextFormField(
                  initialValue: "Pin",
                  readOnly: true,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Enter Voucher Type'.toLowerCase(),
                    hintStyle: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w300),
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
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Vouchers valid for',
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
                      child: TextField(
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Enter Validity'.toLowerCase(),
                          hintStyle: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        child: DropdownButtonFormField(
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            hintText: 'Validity Type'.toLowerCase(),
                            hintStyle: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                            ),
                          ),
                          items: _validityList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            );
                          }).toList(),
                          focusColor: Colors.white,
                          onChanged: (String? newValue){
                            setState(() {
                              selectedValidity = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),


          








        ],
      ),
    );
  }
}
