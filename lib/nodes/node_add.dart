import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';

class NodeAdd extends StatefulWidget {

  @override
  State<NodeAdd> createState() => _NodeAddState();
}

class _NodeAddState extends State<NodeAdd> {
  var _zone=[
    "Service Person 1",
    "Service Person 2",
    "Service Person 3",
    "Service Person 4",
    "Service Person 5",
  ];
  var selectedServicePerson=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Node"),
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
                  child: Text('Node Name',
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
                    hintText: 'Enter Node Name'.toLowerCase(),
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
            child: Column(
              children: [

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Description',
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
                  child: Text('Location ',
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
                    hintText: 'Enter Latitude'.toLowerCase(),
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
                SizedBox(height: 8,),
                TextField(
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Enter Longitude'.toLowerCase(),
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
                SizedBox(height: 8,),
                TextField(
                  readOnly: true,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  onTap: (){

                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Select Location'.toLowerCase(),
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
