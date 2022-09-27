import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class InstantSmsBottomSheet extends StatefulWidget {
  @override
  _InstantSmsBottomSheetState createState() => _InstantSmsBottomSheetState();
}


class _InstantSmsBottomSheetState extends State<InstantSmsBottomSheet> with TickerProviderStateMixin{

List smsList = [
  {
    "id": "001",
    "message" : "lorem ipsum dolor sit amet is a simply dummmy text used for typesetting",
    "date" : "22-Sep-2022",
    "time" : "12:55PM",
  },
  {
    "id": "002",
    "message" : "lorem ipsum dolor sit amet is a simply dummmy text used for typesetting",
    "date" : "23-Sep-2022",
    "time" : "01:55PM",
  },
  {
    "id": "003",
    "message" : "lorem ipsum dolor sit amet is a simply dummmy text used for typesetting",
    "date" : "25-Sep-2022",
    "time" : "10:05AM",
  },
];
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
                  child: Text('Instant SMS',
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
                child: ListView.separated(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: smsList == null ? 0 : smsList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Map item = smsList[index];
                    return Card(
                      color: Theme.of(context).colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Theme.of(context).colorScheme.surface),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                )
                              ),
                              
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 36, height: 36,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/default.jpg'),
                                      radius: 60,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text('${item["message"]}',
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2
                                    ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${item["date"]}'.toUpperCase(),
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.labelSmall,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('${item["time"]}'.toUpperCase(),
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.labelSmall,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      )
                    );
                  }
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
                  child: Container(
                    color: Theme.of(context).colorScheme.background,
                    child: TextField(
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'Type Message...'.toLowerCase(),
                        hintStyle: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w300
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    // border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    tooltip: 'Send',
                    style: IconButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                        ),
                      )
                    ),
                    onPressed: (){}, 
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
