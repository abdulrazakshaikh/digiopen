import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class AccessRequestListItem extends StatefulWidget {
  late Map item;

  AccessRequestListItem(this.item);

  @override
  State<StatefulWidget> createState() {
    return AccessRequestListItemState();
  }
}

class AccessRequestListItemState extends State<AccessRequestListItem> {
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
    /* var string = item['subscriber_invoices.due_by'].toString().substring(0,10).toString();
    String due_by=DateFormat('dd-MMM-yyyy').format(DateFormat('yyyy-MM-dd').parse(string));*/

    return GestureDetector(
      onTap: () {
        /*Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(opacity: animation, child: PaymentDetails(item)),
          ),
        );*/
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
                          'Requested on : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscriber_access_requests.requested_on"]}',
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
                          'Username : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscriber_access_requests.username"]}',
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
            SizedBox(height: 10),
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
                          'Client MAC Address : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscriber_access_requests.client_mac_address"]}',
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
                          'Client IP Address : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscriber_access_requests.client_ip_address"]}',
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
                          'NAS IP Address : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Html(
                          data:
                              '${item["subscriber_access_requests.nas_ip_address"]}',
                          /*style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2
                          ),*/
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
                          'Reply Type : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscriber_access_requests.reply_type"]}',
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
                          'Reply Message : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscriber_access_requests.reply_message"]}',
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
    ;
  }
}
