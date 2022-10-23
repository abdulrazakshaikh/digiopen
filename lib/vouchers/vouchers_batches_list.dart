import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/leads/leads_add.dart';
import 'package:xceednet/leads/leads_details.dart';
import 'package:xceednet/subscribers/subscribers_add.dart';
import 'package:xceednet/subscribers/subscribers_details.dart';
import 'package:xceednet/vouchers/voucherbatch_add.dart';
import 'package:xceednet/vouchers/voucherbatch_details.dart';

class VouchersBatchesList extends StatefulWidget {



  
  @override
  State<VouchersBatchesList> createState() => _VouchersBatchesListState();
}

class _VouchersBatchesListState extends State<VouchersBatchesList> {

List subscribersList = [
  {
    "id": "101",
    "batchid": "YZUUU",
    "packagename": "100",
    "totalvouchers": "2",
    "usedvouchers": "0",
    "unusedvouchers": "2",
    "vouchersvalid" : "01/09/2022 15:59",
    "status" : "Open",
  },
  {
    "id": "102",
    "batchid": "YZUUU",
    "packagename": "100",
    "totalvouchers": "2",
    "usedvouchers": "0",
    "unusedvouchers": "2",
    "vouchersvalid" : "01/09/2022 15:59",
    "status" : "Cancelled",
  },
  {
    "id": "103",
    "batchid": "YZUUU",
    "packagename": "100",
    "totalvouchers": "2",
    "usedvouchers": "0",
    "unusedvouchers": "2",
    "vouchersvalid" : "01/09/2022 15:59",
    "status" : "Expired",
  },

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        
        title: Text("Voucher Batches"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                    opacity: animation,
                    child: VoucherBatchAdd()
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
                        child: VoucherBatchDetails()
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
                                  Text('Voucher Batch ID : '.toLowerCase(),
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
                                  Text('Batch id : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["batchid"]}',
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
                                  Text('Package Name : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["packagename"]}',
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
                                  Text('Total Vouchers : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["totalvouchers"]}',
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
                                  Text('Used Vouchers : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["usedvouchers"]}',
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
                                  Text('Unused Vouchers : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["unusedvouchers"]}',
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
                                  Text('Vouchers Valid Till : '.toLowerCase(),
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5
                                  ),
                                  ),
                                  SizedBox(height: 3),
                                  Text('${item["vouchersvalid"]}',
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
                                    item["status"] == "Open" ? Colors.green :
                                    item["status"] == "Expired" ? Colors.redAccent :
                                    item["status"] == "Cancelled" ? Colors.red :
                                    null,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                  child: Text(
                                    item["status"] == "Open" ? 'Open'.toUpperCase() :
                                    item["status"] == "Expired" ? 'Expired'.toUpperCase() :
                                    item["status"] == "Cancelled" ? 'Cancelled'.toUpperCase() :
                                    '-',
                                    style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context).textTheme.bodyMedium, 
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
