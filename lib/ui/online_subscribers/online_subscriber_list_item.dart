import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/ui/subscribers/subscribers_details.dart';

class OnlineSubscriberListItem extends StatefulWidget {
  late Map item;

  OnlineSubscriberListItem(this.item);

  @override
  State<StatefulWidget> createState() {
    return OnlineSubscriberListItemState();
  }
}

class OnlineSubscriberListItemState extends State<OnlineSubscriberListItem> {
  late Map item;

  @override
  void initState() {
    item = widget.item;
    /*  item={
      "id": "ABC0001",
      "username" : "john310",
      "name" : "${item['subscribers.name']}",
      "mobile" : "9876543210",
      "zone" : "Sanpada",
      "node" : "Sector - 88",
      "package" : "350MBPS",
      "online" : "yes",
      "renewedat" : "01 Sep, 2022",
      "expiredat" : "30 Sep, 2022",
      "status" : "Active",
    };*/
  }

  @override
  Widget build(BuildContext context) {
    /* var string =
        item['subscribers.renewed_at'].toString().substring(0, 10).toString();
    var string1 =
        item['subscribers.expires_at'].toString().substring(0, 10).toString();
    String renewed = DateFormat('dd-MMM-yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(string));
    String expires_at = DateFormat('dd-MMM-yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(string1));*/
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
                    opacity: animation,
                    child:
                        SubscribersDetails(item['subscribers.id'].toString())),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Theme.of(context).dividerColor)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Theme.of(context).dividerColor))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.username"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Logon Time : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.acctstarttime"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
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
                        Text(
                          'NAS : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.nasipaddress"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAS Id : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.nasipaddress"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
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
                        Text(
                          'MAC Address : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.callingstationid"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IP Address : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.framedipaddress"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
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
                        Text(
                          'Upload : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.acctinputoctets"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Download : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["radacct.acctoutputoctets"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
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
}
