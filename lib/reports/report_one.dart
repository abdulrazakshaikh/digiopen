import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportOne extends StatefulWidget {
  @override
  _ReportOneState createState() => new _ReportOneState();
}

class _ReportOneState extends State<ReportOne> {

  var _options = [
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
  ];

  var selectOptions = '';
  
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
      children: [

        Card(
          color: Theme.of(context).colorScheme.background,
          margin: EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
          ),
          child: ExpansionTile(
            backgroundColor: Theme.of(context).colorScheme.background,
            collapsedBackgroundColor: Theme.of(context).colorScheme.background, 
            tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            // childrenPadding: EdgeInsets.all(15),
            title: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Subscribers',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  letterSpacing: 1.2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            subtitle: Text('Generate report for the list of all subscribers',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelMedium,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500
              ),
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                  ),
                ),
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [

                          
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text('Zone',
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
                                    hintText: 'Select an Options'.toLowerCase(),
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
                                  items: _options.map((String value) {
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
                                      selectOptions = newValue!;
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
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text('Node',
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
                                    hintText: 'Select an Options'.toLowerCase(),
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
                                  items: _options.map((String value) {
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
                                      selectOptions = newValue!;
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
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text('Status',
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
                                    hintText: 'Select an Options'.toLowerCase(),
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
                                  items: _options.map((String value) {
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
                                      selectOptions = newValue!;
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
                                  child: Text('Created Date Period',
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
                                    hintText: 'Select Date Period'.toLowerCase(),
                                    hintStyle: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.bodyMedium,
                                      letterSpacing: 1.8,
                                      fontWeight: FontWeight.w300),
                                    suffixIcon: Icon(Icons.date_range_outlined),
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
                            child: CheckboxListTile(
                              title: Text('Add Column for Balance Due',
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
                              value: isChecked,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),  
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                alignment: Alignment.center,
                              ),
                              child: Text('Generate Report'),
                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                )
              ),

            ],
          ),
        ),

        Card(
          color: Theme.of(context).colorScheme.background,
          margin: EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
          ),
          child: ExpansionTile(
            backgroundColor: Theme.of(context).colorScheme.background,
            collapsedBackgroundColor: Theme.of(context).colorScheme.background, 
            tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // childrenPadding: EdgeInsets.all(15),
            title: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Current/previous Usage',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  letterSpacing: 1.2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            subtitle: Text('Generate report for the current or previous usage for particular period',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelMedium,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500
              ),
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                  ),
                ),
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [

                          
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text('Type of Subscribers',
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
                                    hintText: 'Select an Options'.toLowerCase(),
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
                                  items: _options.map((String value) {
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
                                      selectOptions = newValue!;
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
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text('Subscribers',
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
                                    hintText: 'Select an Options'.toLowerCase(),
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
                                  items: _options.map((String value) {
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
                                      selectOptions = newValue!;
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
                                  child: Text('Usage Period',
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
                                    hintText: 'Select Date Period'.toLowerCase(),
                                    hintStyle: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.bodyMedium,
                                      letterSpacing: 1.8,
                                      fontWeight: FontWeight.w300),
                                    suffixIcon: Icon(Icons.date_range_outlined),
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
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text('Usage',
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
                                    hintText: 'Select an Options'.toLowerCase(),
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
                                  items: _options.map((String value) {
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
                                      selectOptions = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          
                          

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),  
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                alignment: Alignment.center,
                              ),
                              child: Text('Generate Report'),
                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                )
              ),

            ],
          ),
        ),
        
        Card(
          color: Theme.of(context).colorScheme.background,
          margin: EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
          ),
          child: ExpansionTile(
            backgroundColor: Theme.of(context).colorScheme.background,
            collapsedBackgroundColor: Theme.of(context).colorScheme.background, 
            tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // childrenPadding: EdgeInsets.all(15),
            title: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Online Subscribers',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  letterSpacing: 1.2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            subtitle: Text('Generate report for the list of all subscribers, who were online on a particular date & time',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelMedium,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500
              ),
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                  ),
                ),
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [

                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text('Online at',
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
                                    hintText: 'Select Date'.toLowerCase(),
                                    hintStyle: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.bodyMedium,
                                      letterSpacing: 1.8,
                                      fontWeight: FontWeight.w300),
                                    suffixIcon: Icon(Icons.date_range_outlined),
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
                    ),

                    Container(
                      padding: EdgeInsets.all(10),  
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                alignment: Alignment.center,
                              ),
                              child: Text('Generate Report'),
                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                )
              ),

            ],
          ),
        ),
        
        Card(
          color: Theme.of(context).colorScheme.background,
          margin: EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
          ),
          child: ExpansionTile(
            backgroundColor: Theme.of(context).colorScheme.background,
            collapsedBackgroundColor: Theme.of(context).colorScheme.background, 
            tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // childrenPadding: EdgeInsets.all(15),
            title: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Static IP Address',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  letterSpacing: 1.2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            subtitle: Text('Generate report for the list of all subscribers with static IP',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelMedium,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500
              ),
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                  ),
                ),
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.all(10),  
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                alignment: Alignment.center,
                              ),
                              child: Text('Generate Report'),
                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                )
              ),

            ],
          ),
        ),
        
      
      ],
      ),
    );
  }
}