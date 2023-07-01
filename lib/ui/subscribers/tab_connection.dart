import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabConnection extends StatefulWidget {
  Map subscriberDetail;

  TabConnection(this.subscriberDetail);

  @override
  _TabConnectionState createState() => _TabConnectionState(subscriberDetail);
}

class _TabConnectionState extends State<TabConnection> {
  Map subscriberDetail;

  _TabConnectionState(this.subscriberDetail);

  List connectionList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectionList = [
      {
        "id": "001",
        "label": "Zone",
        "value": "${subscriberDetail['location_zone_id'] ?? ""}"
      },
      {
        "id": "002",
        "label": "Node",
        "value": "${subscriberDetail['location_node_id'] ?? ""}"
      },
      {
        "id": "003",
        "label": "Distance From Node",
        "value": "${subscriberDetail['distance_from_node'] ?? ""}"
      },
      {
        "id": "004",
        "label": "Fix IP Address",
        "value": "${subscriberDetail['fix_ip']}"
      },
      {
        "id": "005",
        "label": "Bind MAC Address",
        "value": "${subscriberDetail['bind_mac_address']}",
      },
      {
        "id": "005",
        "label": "Allow Device",
        "value": "${subscriberDetail['allow_devices']}",
      },
      {
        "id": "006",
        "label": "MAC Address",
        "value": "${subscriberDetail['mac_address'] ?? ""}"
      },
      {
        "id": "007",
        "label": "Reset MAC Address",
        "value": '${subscriberDetail['reset_mac_address']}'
      },
      {
        "id": "008",
        "label": "Leased Line Subscriber",
        "value": "${subscriberDetail['leased_line_subscriber']}"
      },
    ];
    if (subscriberDetail['fix_ip']) {
      var index = connectionList
              .indexWhere((element) => element['label'] == "Fix IP Address")
              .toInt() +
          1;
      var string = subscriberDetail['subscriber_ip_addresses'][0]
              ['fix_ip_address']
          .toString();
      print("$string");

      connectionList.insert(index,
          {"id": "009", "label": "Fix IP Address", "value": "${string}"});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: connectionList == null ? 0 : connectionList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = connectionList[index];
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 35,
                        child: Text(
                          '${item["label"]} : ',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 65,
                        child: Text(
                          item["value"] == "false"
                              ? 'No'
                              : item["value"] == "true"
                                  ? 'Yes'
                                  : '${item["value"]}',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: item["value"] == "false"
                                ? Colors.red
                                : item["value"] == "true"
                                    ? Colors.green.shade700
                                    : null,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}