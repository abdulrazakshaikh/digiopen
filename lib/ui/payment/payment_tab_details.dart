import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentTabDetails extends StatefulWidget {
  Map subscriberDetail;

  PaymentTabDetails(this.subscriberDetail);

  @override
  _PaymentTabDetailsState createState() =>
      new _PaymentTabDetailsState(subscriberDetail);
}

class _PaymentTabDetailsState extends State<PaymentTabDetails> {
  Map subscriberDetail = {};

  _PaymentTabDetailsState(this.subscriberDetail);

  List detailsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    detailsList = [
      {
        "id": "001",
        "label": "Payment no",
        "value": "${subscriberDetail['payment_no']}"
      },
      {
        "id": "002",
        "label": "Payment Date",
        "value": "${subscriberDetail['payment_date'] ?? ""}"
      },
      {
        "id": "003",
        "label": "Description",
        "value": "${subscriberDetail['description']}"
      },
      {
        "id": "004",
        "label": "Amount",
        "value": "${subscriberDetail['amount_human']}"
      },
      {
        "id": "005",
        "label": "Mode of payment",
        "value": "${subscriberDetail['mode_of_payment']}"
      },
      {
        "id": "006",
        "label": "Description",
        "value": "${subscriberDetail['description'] ?? ""}"
      },
      {
        "id": "007",
        "label": "Receipt#",
        "value": "${subscriberDetail['receipt_no'] ?? ""}"
      },
      {
        "id": "008",
        "label": "Received By",
        "value": "${widget.subscriberDetail['user_profiles.name'] ?? ""}"
      },
    ];
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
                          item["value"] == false
                              ? 'No'
                              : item["value"] == true
                                  ? 'Yes'
                                  : '${item["value"]}',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: item["value"] == false
                                ? Colors.red
                                : item["value"] == true
                                    ? Colors.green.shade700
                                    : null,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
