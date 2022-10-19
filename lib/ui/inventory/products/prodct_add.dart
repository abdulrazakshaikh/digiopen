import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/subscribers/subscribers_list.dart';

class ProductAdd extends StatefulWidget {

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var _serialMac=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Product"),
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
                  Navigator.pushReplacement<void, void>(
                    context, MaterialPageRoute(
                      builder: (BuildContext context) => SubscribersList()
                    )
                  );
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
                  child: Text('Product Name',
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
                    hintText: 'Enter Product Name'.toLowerCase(),
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
                    child: Text('Sell Price',
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
                      hintText: 'Enter Sell Price'.toLowerCase(),
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
                      prefixIcon: Icon(Icons.currency_rupee_outlined),
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
                    child: Text('Rent Price',
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
                      hintText: 'Enter Rent Price'.toLowerCase(),
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
                      prefixIcon: Icon(Icons.currency_rupee_outlined),
                    ),
                  ),
                ],
              )
          ),
          Container(
            child: CheckboxListTile(
              title: Text('Serial/MAc Required',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: Theme.of(context).colorScheme.primary,
              value: _serialMac,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _serialMac = value!;
                });
              },
            ),
          ),
          








        ],
      ),
    );
  }
}
