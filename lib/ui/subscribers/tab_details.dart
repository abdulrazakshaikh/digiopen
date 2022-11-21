import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabDetails extends StatefulWidget {
  Map subscriberDetail;

  TabDetails(this.subscriberDetail);

  @override
  _TabDetailsState createState() => new _TabDetailsState(subscriberDetail);
}

class _TabDetailsState extends State<TabDetails> {
  Map subscriberDetail = {};

  _TabDetailsState(this.subscriberDetail);

  List detailsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    detailsList = [
      {
        "id": "001",
        "label": "customerid",
        "value": "${subscriberDetail['subscriberid']}"
      },
      {
        "id": "002",
        "label": "Account",
        "value": "${subscriberDetail['account_no'] ?? ""}"
      },
      {"id": "003", "label": "Name", "value": "${subscriberDetail['name']}"},
      {
        "id": "004",
        "label": "Username",
        "value": "${subscriberDetail['username']}"
      },
      {
        "id": "005",
        "label": "Phone",
        "value": "${subscriberDetail['phone1'] ?? "Key Required"}"
      },
      {
        "id": "006",
        "label": "Mobile",
        "value": "${subscriberDetail['mobile1'] ?? "Key Required"}"
      },
      {"id": "007", "label": "Email", "value": "${subscriberDetail['email']}"},
      {
        "id": "008",
        "label": "Address Line",
        "value":
            "${subscriberDetail['address1']} ${subscriberDetail['address2'] ?? ""}"
      },
      {
        "id": "009",
        "label": "City",
        "value": "${subscriberDetail['city'] ?? ""}"
      },
      {"id": "010", "label": "State", "value": "${subscriberDetail['state']}"},
      {
        "id": "011",
        "label": "Country",
        "value":
            "${subscriberDetail['country'] == 'IN' ? "India" : subscriberDetail['country']}"
      },
      {"id": "012", "label": "Zipcode", "value": "${subscriberDetail['zip']}"},
      {
        "id": "013",
        "label": "Hotspot Subscriber",
        "value": '${subscriberDetail['hotspot_subscriber']}',
      },
      {
        "id": "014",
        "label": "Blocked",
        "value": '${subscriberDetail['blocked']}',
      },
      {
        "id": "015",
        "label": "Auto Renew",
        "value": '${subscriberDetail['auto_renew']}',
      },
      {
        "id": "016",
        "label": "Sticky Password",
        "value": '${subscriberDetail['sticky_password']}',
      },
      {
        "id": "017",
        "label": "Subscriber Since",
        "value": "${subscriberDetail['subscriber_since']}"
      },
      {
        "id": "018",
        "label": "Type",
        "value": "${subscriberDetail['subscriber_type']}"
      },
      {
        "id": "019",
        "label": "Discount",
        "value": "${subscriberDetail['discount']}%"
      },
      {
        "id": "020",
        "label": "Note",
        "value": "${subscriberDetail['note'] ?? ""}"
      },
      {
        "id": "021",
        "label": "GST Number",
        "value": "${subscriberDetail['gst_no'] ?? ""}"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: detailsList == null ? 0 : detailsList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = detailsList[index];
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 35,
                        child: Text('${item["label"]} : ',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.5
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 65,
                        child: Text(
                          item["value"] == false ? 'No' : item["value"] == true ? 'Yes' : '${item["value"]}',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color:
                            item["value"] == false ? Colors.red : item["value"] == true ? Colors.green.shade700 : null,
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