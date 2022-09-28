import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';

class SaleItemAdd extends StatefulWidget {

  @override
  State<SaleItemAdd> createState() => _SaleItemAddState();
}

class _SaleItemAddState extends State<SaleItemAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Sale Item"),
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
                  child: Text('Full Name',
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
                    hintText: 'Enter Full Name'.toLowerCase(),
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
                  child: Text('Mobile',
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
                    hintText: 'Enter Mobile Number'.toLowerCase(),
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
                  child: Text('Phone Number',
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
                    hintText: 'Enter Phone Number'.toLowerCase(),
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
                  child: Text('Email',
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
                    hintText: 'Enter Email'.toLowerCase(),
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

          Divider(height: 30),

          Container(
            child: Column(
              children: [

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Address Line',
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
                    hintText: 'Enter Address Line'.toLowerCase(),
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
                  child: Text('Pincode',
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
                    hintText: 'Enter Pincode'.toLowerCase(),
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
                  child: Text('Country',
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
                    hintText: 'Select Country'.toLowerCase(),
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
                  child: Text('State',
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
                    hintText: 'Enter State'.toLowerCase(),
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
                  child: Text('City',
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
                    hintText: 'Select City'.toLowerCase(),
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

          Divider(height: 30),

          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Comment',
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

          








        ],
      ),
    );
  }
}
