import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}


class _FilterBottomSheetState extends State<FilterBottomSheet> with TickerProviderStateMixin{

  var _financialyear = [
    "2019-2020",
    "2020-2021",
    "2021-2022",
    "2022-2023",
  ];

  var selectedFinancialValue = '2021-2022';

  var _segment = [
    "ABC",
    "DEF",
    "GHI",
    "JKL",
    "MNO",
  ];

  var selectedSegmentValue = 'DEF';


@override
Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
            ),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text('Filter',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [                  
                  
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         alignment: Alignment.topLeft,
                    //         padding: EdgeInsets.symmetric(vertical: 5),
                    //         child: Text('Date Range',
                    //         style: GoogleFonts.robotoCondensed(
                    //           textStyle: Theme.of(context).textTheme.labelLarge,
                    //           letterSpacing: 1.75,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //         ),
                    //       ),
                    //       TextField(
                    //         style: GoogleFonts.roboto(
                    //           textStyle: Theme.of(context).textTheme.bodyMedium,
                    //           fontWeight: FontWeight.w600,
                    //           letterSpacing: 1.2,
                    //         ),
                    //         autofocus: false,
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    //           floatingLabelBehavior: FloatingLabelBehavior.never,
                    //           hintText: 'Date Range'.toLowerCase(),
                    //           hintStyle: GoogleFonts.roboto(
                    //             textStyle: Theme.of(context).textTheme.bodyMedium,
                    //             letterSpacing: 1.8,
                    //             fontWeight: FontWeight.w300),

                    //           suffixIcon: Icon(Icons.calendar_month_outlined),
                              
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   )
                    // ),
                    // SizedBox(height: 10),
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         alignment: Alignment.topLeft,
                    //         padding: EdgeInsets.symmetric(vertical: 5),
                    //         child: Text('Financial Year',
                    //         style: GoogleFonts.robotoCondensed(
                    //           textStyle: Theme.of(context).textTheme.labelLarge,
                    //           letterSpacing: 1.75,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //         ),
                    //       ),
                    //       DropdownButtonFormField(
                    //         style: GoogleFonts.roboto(
                    //           textStyle: Theme.of(context).textTheme.bodyMedium,
                    //           fontWeight: FontWeight.w600,
                    //           letterSpacing: 1.2,
                    //         ),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(10),
                    //           floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //           hintText: 'Financial Year'.toLowerCase(),
                    //           hintStyle: GoogleFonts.roboto(
                    //             textStyle: Theme.of(context).textTheme.bodyMedium,
                    //             letterSpacing: 1.8,
                    //             fontWeight: FontWeight.w300),
                              
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                    //           ),
                    //         ),
                    //         items: _financialyear.map((String value) {
                    //           return DropdownMenuItem<String>(
                    //             value: value,
                    //             child: Text(value,
                    //             style: GoogleFonts.roboto(
                    //               textStyle: Theme.of(context).textTheme.bodyMedium,
                    //               fontWeight: FontWeight.w600,
                    //               letterSpacing: 1.2,
                    //             ),
                    //             ),
                    //           );
                    //         }).toList(), 
                    //         focusColor: Colors.white,
                    //         onChanged: (String? newValue){
                    //           setState(() {
                    //             selectedFinancialValue = newValue!;
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         alignment: Alignment.topLeft,
                    //         padding: EdgeInsets.symmetric(vertical: 5),
                    //         child: Text('Segment',
                    //         style: GoogleFonts.robotoCondensed(
                    //           textStyle: Theme.of(context).textTheme.labelLarge,
                    //           letterSpacing: 1.75,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //         ),
                    //       ),
                    //       DropdownButtonFormField(
                    //         style: GoogleFonts.roboto(
                    //           textStyle: Theme.of(context).textTheme.bodyMedium,
                    //           fontWeight: FontWeight.w600,
                    //           letterSpacing: 1.2,
                    //         ),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(10),
                    //           floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //           hintText: 'Segment'.toLowerCase(),
                    //           hintStyle: GoogleFonts.roboto(
                    //             textStyle: Theme.of(context).textTheme.bodyMedium,
                    //             letterSpacing: 1.8,
                    //             fontWeight: FontWeight.w300),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                    //           ),
                    //         ),
                    //         items: _segment.map((String value) {
                    //           return DropdownMenuItem<String>(
                    //             value: value,
                    //             child: Text(value,
                    //             style: GoogleFonts.roboto(
                    //               textStyle: Theme.of(context).textTheme.bodyMedium,
                    //               fontWeight: FontWeight.w600,
                    //               letterSpacing: 1.2,
                    //             ),
                    //             ),
                    //           );
                    //         }).toList(), 
                    //         focusColor: Colors.white,
                    //         onChanged: (String? newValue){
                    //           setState(() {
                    //             selectedSegmentValue = newValue!;
                    //           });
                    //         },
                    //       ),

                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      alignment: Alignment.center,
                    ),
                    child: Text('Cancel',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                  onPressed: (){
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, 
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.center,
                  ),
                  child: Text('Apply'),
                ),
                ),
              ],
            ),
          ),
      ],
    ),
    

    );
  }

}
