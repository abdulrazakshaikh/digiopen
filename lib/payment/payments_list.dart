import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/leads/leads_add.dart';
import 'package:xceednet/leads/leads_details.dart';
import 'package:xceednet/payment/payment_add.dart';
import 'package:xceednet/payment/payment_details.dart';
import 'package:xceednet/subscribers/subscribers_add.dart';
import 'package:xceednet/subscribers/subscribers_details.dart';

class PaymentList extends StatefulWidget {



  
  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {

List subscribersList = [
  {
    "id": "101",
    "status" : "Assigned",
    "username" : "johndoe121",
    "name" : "John Doe",
    "paymentdate" : "01 Sep, 2022",
    "receiptnum" : "REC15454",
    "amount" : "₹500",
    "receivedby" : "Johnson Doe",
  },
  {
    "id": "102",
    "status" : "Closed",
    "username" : "johndoe121",
    "name" : "John Doe",
    "paymentdate" : "01 Sep, 2022",
    "receiptnum" : "REC15454",
    "amount" : "₹500",
    "receivedby" : "Johnson Doe",
  },
  {
    "id": "103",
    "status" : "Open",
    "username" : "johndoe121",
    "name" : "John Doe",
    "paymentdate" : "01 Sep, 2022",
    "receiptnum" : "REC15454",
    "amount" : "₹500",
    "receivedby" : "Johnson Doe",
  },

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        
        title: Text("Payments"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                    opacity: animation,
                    child: PaymentAdd(title: 'Add Payment',)
                  ),
                ),
              );
            }, 
            icon: Icon(Icons.add), 
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
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
              itemCount: subscribersList == null ? 0 : subscribersList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = subscribersList[index];
                return InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                        FadeTransition(
                        opacity: animation,
                        child: PaymentDetails()
                      ),
                    ),
                  );
                },
                child: Card(
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
                                  Text('Payment ID : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["id"]}',
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
                                  Text('Name : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["name"]}',
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
                                  Text('Payment Date : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["paymentdate"]}',
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
                                  Text('Receipt #: '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["receiptnum"]}',
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
                                  Text('Amount : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["amount"]}',
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
                                  Text('Received By : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["receivedby"]}',
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
                                  Text('Status : '.toLowerCase(),
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.5
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Container(
                                  decoration: BoxDecoration(
                                    color: 
                                    item["status"] == "Open" ? Colors.blue :
                                    item["status"] == "Assigned" ? Colors.deepPurple :
                                    item["status"] == "Reassigned" ? Colors.deepPurple : 
                                    item["status"] == "Rejected" ? Colors.red :
                                    item["status"] == "Pending" ? Colors.orange :
                                    item["status"] == "In Process" ? Colors.blue : 
                                    item["status"] == "Cancelled" ? Colors.red :
                                    item["status"] == "Resolved" ? Colors.green :
                                    item["status"] == "Reopen" ? Colors.blue : 
                                    item["status"] == "Closed" ? Colors.green : 
                                    null,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                  child: Text(
                                    item["status"] == "Open" ? 'Open'.toUpperCase() :
                                    item["status"] == "Assigned" ? 'Assigned'.toUpperCase() :
                                    item["status"] == "Reassigned" ? 'Reassigned'.toUpperCase() :
                                    item["status"] == "Rejected" ? 'Rejected'.toUpperCase() :
                                    item["status"] == "Pending" ? 'Pending'.toUpperCase() :
                                    item["status"] == "In Process" ? 'In Process'.toUpperCase() :
                                    item["status"] == "Cancelled" ? 'Cancelled'.toUpperCase() :
                                    item["status"] == "Resolved" ? 'Resolved'.toUpperCase() :
                                    item["status"] == "Reopen" ? 'Reopen'.toUpperCase() : 
                                    item["status"] == "Closed" ? 'Closed'.toUpperCase() :
                                    '-',
                                    style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context).appBarTheme.titleTextStyle, 
                                      fontSize: 11, color: Colors.white, letterSpacing: 1.5,
                                    ),
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
