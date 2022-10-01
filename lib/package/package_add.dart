import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';

class PackageAdd extends StatefulWidget {

  @override
  State<PackageAdd> createState() => _PackageAddState();
}

class _PackageAddState extends State<PackageAdd> {
  var _validityList = [
    "Hour/s",
    "Day/s",
    "Week/s",
    "Month/s",
    "Year/s",
  ];
  var _packageList = [
    "None",
    "Commercial",
    "Residencial",
    "Fiber",
    "Wireless",
  ];
  var _SpeedList = [
    "Kbps",
    "Mbps",
  ];
  String? selectedPackage="None";
  String? selectedValidity=null;
  String? selectedSpeed="Mbps";

  bool _noChargeTax = true;
  bool _availableHotspotSubscribers = false;
  bool _availableOnlinePayment = false;
  bool _bindIpPool = false;

  bool _roundOff = false;
                          


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Package"),
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
                  child: Text(' Name',
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
                    hintText: 'Enter Package Name'.toLowerCase(),
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
                    child: Text('Valid for',
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
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Bandwidth (Upload)',
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        letterSpacing: 1.75,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            hintText: 'Enter Speed'.toLowerCase(),
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
                            value: selectedSpeed,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: 'Speed Type'.toLowerCase(),
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
                            items: _SpeedList.map((String value) {
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
                                selectedSpeed = newValue!;
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
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Bandwidth (Download)',
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
                            hintText: 'Enter Speed'.toLowerCase(),
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
                            value: selectedSpeed,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: 'Speed Type'.toLowerCase(),
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
                            items: _SpeedList.map((String value) {
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
                                selectedSpeed = newValue!;
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
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Package Type ',
                    style: GoogleFonts.robotoCondensed(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      letterSpacing: 1.75,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  value: selectedPackage,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintText: 'Select Package Type'.toLowerCase(),
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
          // Container(
          //     margin: EdgeInsets.only(bottom: 10),
          //     child: Column(
          //       children: [

          //         Container(
          //           alignment: Alignment.topLeft,
          //           padding: EdgeInsets.symmetric(vertical: 5),
          //           child: Text('Description',
          //             style: GoogleFonts.robotoCondensed(
          //               textStyle: Theme.of(context).textTheme.labelLarge,
          //               letterSpacing: 1.75,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //         ),

          //         TextField(
          //           style: GoogleFonts.roboto(
          //             textStyle: Theme.of(context).textTheme.bodyMedium,
          //             fontWeight: FontWeight.w600,
          //             letterSpacing: 1.2,
          //           ),
          //           maxLines: 4,
          //           decoration: InputDecoration(
          //             floatingLabelBehavior: FloatingLabelBehavior.never,
          //             hintText: 'Enter Description'.toLowerCase(),
          //             hintStyle: GoogleFonts.roboto(
          //                 textStyle: Theme.of(context).textTheme.bodyMedium,
          //                 letterSpacing: 1.8,
          //                 fontWeight: FontWeight.w300),
          //             enabledBorder: OutlineInputBorder(
          //               borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          //             ),
          //             focusedBorder: OutlineInputBorder(
          //               borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
          //             ),
          //           ),
          //         ),
          //       ],
          //     )
          // ),
          
          
          Container(
            margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [

                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Price to subscriber',
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
                      hintText: 'Enter Price'.toLowerCase(),
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
              title: Text('Do Not Charge Tax',
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
              value: _noChargeTax,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _noChargeTax = value!;
                  
                });
              },
            ),
          ),

          _noChargeTax == true ?
          Container() :
          AnimatedContainer(
            duration: Duration (seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Theme.of(context).dividerColor)
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(                
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CheckboxListTile(
                        title: Text('Roundoff Applicable',
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
                        value: _roundOff,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            _roundOff = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [

                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text('Price to Subscriber After Tax',
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
                              hintText: 'Enter Price'.toLowerCase(),
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
                  ],
                ),
              )
            ),
          ),

          Container(
            child: CheckboxListTile(
              title: Text('Available for Hotspot Subscribers',
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
              value: _availableHotspotSubscribers,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _availableHotspotSubscribers = value!;
                });
              },
            ),
          ),
          _availableHotspotSubscribers == false ?
          Container() :
          AnimatedContainer(
            duration: Duration (seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Theme.of(context).dividerColor)
              ),
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
                            child: Text('Advertisement URL',
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
                              hintText: 'Enter url'.toLowerCase(),
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
                            child: Text('Advertisement Interval',
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
                              hintText: 'Enter Interval'.toLowerCase(),
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
                              suffix: Text('Seconds'.toLowerCase(),
                              style: GoogleFonts.robotoCondensed(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w500
                              ),
                              )
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
              title: Text('Available for Online Payment',
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
              value: _availableOnlinePayment,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _availableOnlinePayment = value!;
                });
              },
            ),
          ),

          Container(
            child: CheckboxListTile(
              title: Text('Bind IP',
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
              value: _bindIpPool,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _bindIpPool = value!;
                });
              },
            ),
          ),

          _bindIpPool == false ?
          Container() :
          AnimatedContainer(
            duration: Duration (seconds: 2),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Theme.of(context).dividerColor)
              ),
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
                            child: Text('IP Pool Name',
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
                              helperText: 'Must Exist in Router'.toLowerCase(),
                                helperStyle: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                              hintText: 'Enter IP'.toLowerCase(),
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
                            child: Text('FUP IP Pool Name',
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
                              helperText: 'Must Exist in Router'.toLowerCase(),
                                helperStyle: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                              hintText: 'Enter IP'.toLowerCase(),
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
                              )
                            ),
                        ],
                      )
                    ),
                    
                  ],
                ),
              )
            ),
          ),
          


          


          








        ],
      ),
    );
  }
}
