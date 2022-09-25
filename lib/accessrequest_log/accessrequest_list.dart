import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/profile/confirmation.dart';

class AccessRequestList extends StatefulWidget {

  
  @override
  State<AccessRequestList> createState() => _AccessRequestListState();
}

class _AccessRequestListState extends State<AccessRequestList> {


List accessLogList = [
  {
    "id": "001",
    "requestedon" : "01 Sep, 2022",
    "username" : "john310",
    "nasipaddress" : "192.168.1.1",
    "clientmacaddress" : "123.123.123.123.001",
    "clientipaddress" : "192.168.1.1",
    "replytype" : "Lorem Ipsum",
    "replymessage" : "Lorem Ipsum Dolor Sit amet is simply dummy text used for typesetting",
  },
  {
    "id": "002",
    "requestedon" : "01 Sep, 2022",
    "username" : "john310",
    "nasipaddress" : "192.168.1.1",
    "clientmacaddress" : "123.123.123.123.001",
    "clientipaddress" : "192.168.1.1",
    "replytype" : "Lorem Ipsum",
    "replymessage" : "Lorem Ipsum Dolor Sit amet is simply dummy text used for typesetting",
  },
  {
    "id": "003",
    "requestedon" : "01 Sep, 2022",
    "username" : "john310",
    "nasipaddress" : "192.168.1.1",
    "clientmacaddress" : "123.123.123.123.001",
    "clientipaddress" : "192.168.1.1",
    "replytype" : "Lorem Ipsum",
    "replymessage" : "Lorem Ipsum Dolor Sit amet is simply dummy text used for typesetting",
  },
  {
    "id": "004",
    "requestedon" : "01 Sep, 2022",
    "username" : "john310",
    "nasipaddress" : "192.168.1.1",
    "clientmacaddress" : "123.123.123.123.001",
    "clientipaddress" : "192.168.1.1",
    "replytype" : "Lorem Ipsum",
    "replymessage" : "Lorem Ipsum Dolor Sit amet is simply dummy text used for typesetting",
  },
  {
    "id": "005",
    "requestedon" : "01 Sep, 2022",
    "username" : "john310",
    "nasipaddress" : "192.168.1.1",
    "clientmacaddress" : "123.123.123.123.001",
    "clientipaddress" : "192.168.1.1",
    "replytype" : "Lorem Ipsum",
    "replymessage" : "Lorem Ipsum Dolor Sit amet is simply dummy text used for typesetting",
  },
  {
    "id": "006",
    "requestedon" : "01 Sep, 2022",
    "username" : "john310",
    "nasipaddress" : "192.168.1.1",
    "clientmacaddress" : "123.123.123.123.001",
    "clientipaddress" : "192.168.1.1",
    "replytype" : "Lorem Ipsum",
    "replymessage" : "Lorem Ipsum Dolor Sit amet is simply dummy text used for typesetting",
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Access Request Log"),
        actions: [
          IconButton(
            onPressed: (){}, 
            tooltip: 'Delete All Access Request Log',
            icon: Icon(Icons.delete_forever_outlined), 
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
              // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              foregroundColor: Colors.red,
              minimumSize: Size(54, 54),
              fixedSize: Size(54, 54),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          HeadToolbar(),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListView.separated(
              
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: accessLogList == null ? 0 : accessLogList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = accessLogList[index];
                return Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                          )
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Requested on : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["requestedon"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Username : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["username"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height : 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Client MAC Address : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["clientmacaddress"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Client IP Address : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["clientipaddress"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('NAS IP Address : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["nasipaddress"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Reply Type : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["replytype"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Reply Message : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["replymessage"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),

                      SizedBox(height : 10),
                    ],
                  ),
                );
              }
            ),
            ),
        
          
        ],
      ),
    );
  }
}
