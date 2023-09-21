import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:xceednet/ui/subscribers/subscribers_details.dart';

class SubscriberListItem extends StatefulWidget {
  late Map item;

  SubscriberListItem(this.item);

  @override
  State<StatefulWidget> createState() {
    return SubscriberListItemState();
  }
}

class SubscriberListItemState extends State<SubscriberListItem> {
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
    var renewed = "NA";
    var expires_at = "NA";
    if (item['subscribers.renewed_at'] != null) {
      String string =
          item['subscribers.renewed_at'] ?? "".substring(0, 10).toString();
      renewed = DateFormat('dd-MMM-yyyy')
          .format(DateFormat('yyyy-MM-dd').parse(string));
    }
    if (item['subscribers.expires_at'] != null) {
      var string1 =
          item['subscribers.expires_at'] ?? "".substring(0, 10).toString();
      expires_at = DateFormat('dd-MMM-yyyy')
          .format(DateFormat('yyyy-MM-dd').parse(string1));
    }
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
                 true
                      ? Container()
                      : Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer ID : '.toLowerCase(),
                                style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5),
                              ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscribers.subscriberid"]}',
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
                          'Username : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscribers.username"]}',
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
                          'Status : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                item["subscribers.online"].toString() != 'false'
                                    ? Colors.greenAccent.shade700
                                    : Colors.redAccent.shade700,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child: Text(
                            '${item["subscribers.online"].toString() != 'false' ? 'online' : 'offline'}',
                            style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2),
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
                        Text(
                          'Name : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscribers.name"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  true
                      ? Container()
                      : Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile : '.toLowerCase(),
                                style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5),
                              ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscribers.mobile"] ?? "Key Required"}',
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
            true
                ? Container()
                : Container(
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
                                'Zone : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["location_zones.name"]['location_zone_name'] ?? "NA"}',
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
                          'Node : '.toLowerCase(),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["location_nodes.name"]['location_node_name'] ?? "NA"}',
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
                          'Package : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["location_packages.name"]['location_package_name']}',
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
                          'Status : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscribers.status"]}',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  true
                      ? Container()
                      : Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Account No : '.toLowerCase(),
                                style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5),
                              ),
                        SizedBox(height: 3),
                        Text(
                          '${item["subscribers.accountno"] ?? "Key Required"}',
                                style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1, color: Theme.of(context).dividerColor))),
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
                        Text(
                          'Renewed at : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${renewed}',
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
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 3,
                      spacing: 5,
                      children: [
                        Text(
                          'Expired at : ',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '$expires_at',
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
