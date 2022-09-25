import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';

class OnlineSubscribersList extends StatefulWidget {

  
  @override
  State<OnlineSubscribersList> createState() => _OnlineSubscribersListState();
}

class _OnlineSubscribersListState extends State<OnlineSubscribersList> {

List onlinesubscribersList = [
  {
    "id": "001",
    "username" : "john310",
    "nas" : "Lorem Ipsum",
    "logontime" : "12:45pm",
    "downloadfile" : "untitled.pdf",
    "macaddress" : "84-3A-48-C8-E9-00",
    "ipaddress" : "192.168.1.0",
    "nasid" : "123456789",
  },
  {
    "id": "002",
    "username" : "john310",
    "nas" : "Lorem Ipsum",
    "logontime" : "12:45pm",
    "downloadfile" : "untitled.pdf",
    "macaddress" : "84-3A-48-C8-E9-00",
    "ipaddress" : "192.168.1.0",
    "nasid" : "123456789",
  },
  {
    "id": "003",
    "username" : "john310",
    "nas" : "Lorem Ipsum",
    "logontime" : "12:45pm",
    "downloadfile" : "untitled.pdf",
    "macaddress" : "84-3A-48-C8-E9-00",
    "ipaddress" : "192.168.1.0",
    "nasid" : "123456789",
  },
  {
    "id": "004",
    "username" : "john310",
    "nas" : "Lorem Ipsum",
    "logontime" : "12:45pm",
    "downloadfile" : "untitled.pdf",
    "macaddress" : "84-3A-48-C8-E9-00",
    "ipaddress" : "192.168.1.0",
    "nasid" : "123456789",
  },
  {
    "id": "005",
    "username" : "john310",
    "nas" : "Lorem Ipsum",
    "logontime" : "12:45pm",
    "downloadfile" : "untitled.pdf",
    "macaddress" : "84-3A-48-C8-E9-00",
    "ipaddress" : "192.168.1.0",
    "nasid" : "123456789",
  },
  {
    "id": "006",
    "username" : "john310",
    "nas" : "Lorem Ipsum",
    "logontime" : "12:45pm",
    "downloadfile" : "untitled.pdf",
    "macaddress" : "84-3A-48-C8-E9-00",
    "ipaddress" : "192.168.1.0",
    "nasid" : "123456789",
  },

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Online Subscribers List"),
        actions: [],
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
              itemCount: onlinesubscribersList == null ? 0 : onlinesubscribersList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = onlinesubscribersList[index];
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
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Logon Time : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["logontime"]}',
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
                                  Text('NAS : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["nas"]}',
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
                                  Text('NAS Id : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["nasid"]}',
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
                                  Text('MAC Address : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["macaddress"]}',
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
                                  Text('IP Address : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["ipaddress"]}',
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
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    child: TextButton.icon(
                                      onPressed: (){}, 
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        // backgroundColor: Colors.grey.shade100,
                                        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                                        foregroundColor: Theme.of(context).colorScheme.secondary
                                      ),
                                      icon: Icon(Icons.file_upload_outlined),
                                      label: Text('upload file',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.bodyMedium,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                          color: Theme.of(context).colorScheme.secondary
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    child: TextButton.icon(
                                      onPressed: (){}, 
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                        foregroundColor: Theme.of(context).colorScheme.primary,
                                      ),
                                      icon: Icon(Icons.file_download_outlined),
                                      label: Text('download file',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.bodyMedium,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                          color: Theme.of(context).colorScheme.primary
                                        ),
                                      ),
                                    ),
                                  ),
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
            ),
            ),
              

        ],
      ),
    );
  }
}
