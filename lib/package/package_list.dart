import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/leads/leads_add.dart';
import 'package:xceednet/leads/leads_details.dart';
import 'package:xceednet/package/package_add.dart';
import 'package:xceednet/package/package_details.dart';
import 'package:xceednet/subscribers/subscribers_add.dart';
import 'package:xceednet/subscribers/subscribers_details.dart';

class PackageList extends StatefulWidget {

  @override
  State<PackageList> createState() => _PackageListState();
}

class _PackageListState extends State<PackageList> {

List packageList = [
  {
    "id": "101",
    "name" : "John Doe",
    "priceofsubscriber" : "100",
    "datalimited" : false,
    "timelimited" : false,
    "hotspotsubscriber" : false,
    "onlinepayment" : false,
    "status" : "published",
  },
  {
    "id": "102",
    "name" : "William Doe",
    "priceofsubscriber" : "500",
    "datalimited" : true,
    "timelimited" : true,
    "hotspotsubscriber" : true,
    "onlinepayment" : true,
    "status" : "unpublished",
  },
  {
    "id": "103",
    "name" : "San te Doe",
    "priceofsubscriber" : "100",
    "datalimited" : false,
    "timelimited" : true,
    "hotspotsubscriber" : false,
    "onlinepayment" : true,
    "status" : "published",
  },

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        
        title: Text("Packages"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                    opacity: animation,
                    child: PackageAdd()
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
                itemCount: packageList == null ? 0 : packageList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  Map item = packageList[index];
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              FadeTransition(
                                  opacity: animation,
                                  child: PackageDetails()
                              ),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
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
                                      Text('Price for Subscriber : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text('${item["priceofsubscriber"]}',
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
                                      Text('Data Limited : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        item["datalimited"] == true ? 'Yes' : 'No',
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
                                      Text('Time Limited : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        item["timelimited"] == true ? 'Yes' : 'No',
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
                                      Text('Hotspot Subscriber : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        item["hotspotsubscriber"] == true ? 'Yes' : 'No',
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
                                      Text('Online Payment: '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        item["onlinepayment"] == true ? 'Yes' : 'No',
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
                                      Text('Status : '.toLowerCase(),
                                        style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context).textTheme.labelMedium,
                                            letterSpacing: 1.5
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text("${item['status']}",
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.bodyMedium,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                          color: 
                                          item['status'] == 'published' ? Colors.greenAccent : 
                                          item['status'] == 'unpublished' ? Colors.redAccent : 
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
                      )
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
