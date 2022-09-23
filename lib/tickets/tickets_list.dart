import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_add.dart';
import 'package:xceednet/tickets/ticket_add.dart';

class TicketsList extends StatefulWidget {
  const TicketsList({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {

List ticketsList = [
  {
    "id": "001",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "high",
    "status" : "open",
  },
  {
    "id": "002",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "low",
    "status" : "assigned",
  },
  {
    "id": "003",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "reassigned",
  },
  {
    "id": "004",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "high",
    "status" : "rejected",
  },
  {
    "id": "005",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "pending",
  },
  {
    "id": "006",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "inprocess",
  },
  {
    "id": "007",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "cancelled",
  },
  {
    "id": "008",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "resolved",
  },
  {
    "id": "009",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "reopened",
  },
  {
    "id": "010",
    "ticketnumber": "#1346556",
    "subject" : "Disconnected Issue",
    "subscriber" : "Samuel Wilkinson",
    "zone" : "Sanpada",
    "assignedto" : "John Wilson",
    "createdat" : "01 Sep, 2022",
    "dueby" : "10 Sep, 2022",
    "priority" : "medium",
    "status" : "closed",
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),       
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                    opacity: animation,
                    child: TicketAdd(title: 'Add Ticket')
                  ),
                ),
              );
            }, 
            icon: Icon(Icons.add), 
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
              // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              foregroundColor: Theme.of(context).colorScheme.primary,
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
              itemCount: ticketsList == null ? 0 : ticketsList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = ticketsList[index];
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
                                  Text('Ticket Number : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["ticketnumber"]}',
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
                                  Text('Subject : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["subject"]}',
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
                                  Text('Subscriber : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["subscriber"]}',
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
                                  Text('Zone : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["zone"]}',
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
                                  Text('Assigned To : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["assignedto"]}',
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
                                  Text('Created at : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["createdat"]}',
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
                                  Text('Due by : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["dueby"]}',
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
                              flex: 5,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runSpacing: 3,
                                spacing: 5,
                                children: [
                                  Text('Priority : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["priority"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                    color: 
                                    item["priority"] == "low" ?
                                    Colors.blue
                                    :
                                    item["priority"] == "medium" ?
                                    Colors.orange
                                    :
                                    item["priority"] == "high" ?
                                    Colors.red
                                    :
                                    item["priority"] == "urgent" ?
                                    Colors.red
                                    :
                                    null,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runSpacing: 3,
                                spacing: 5,
                                children: [
                                  Text('Status : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["status"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                    color: 
                                    item["status"] == "open" ?
                                    Colors.blue
                                    :
                                    item["status"] == "assigned" ?
                                    Colors.deepPurple                                    
                                    :
                                    item["status"] == "reassigned" ?
                                    Colors.deepPurple
                                    :
                                    item["status"] == "rejected" ?
                                    Colors.red
                                    :
                                    item["status"] == "pending" ?
                                    Colors.orange
                                    :
                                    item["status"] == "inprocess" ?
                                    Colors.blue
                                    :
                                    item["status"] == "cancelled" ?
                                    Colors.red
                                    :
                                    item["status"] == "resolved" ?
                                    Colors.green
                                    :
                                    item["status"] == "reopened" ?
                                    Colors.blue
                                    :
                                    item["status"] == "closed" ?
                                    Colors.green
                                    :
                                    null,
                                  ),
                                  ),
                                ],
                              ),
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
