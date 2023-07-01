import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InvoiceTabDetails extends StatefulWidget {
  Map subscriberDetail;

  InvoiceTabDetails(this.subscriberDetail);

  @override
  _InvoiceTabDetailsState createState() =>
      new _InvoiceTabDetailsState(subscriberDetail);
}

class _InvoiceTabDetailsState extends State<InvoiceTabDetails> {
  Map subscriberDetail = {};

  _InvoiceTabDetailsState(this.subscriberDetail);

  List detailsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    detailsList = [
      {
        "id": "001",
        "label": "Invoice no",
        "value": "${subscriberDetail['invoiceid']}"
      },
      {
        "id": "002",
        "label": "Invoice Date",
        "value": "${getDateInSring(subscriberDetail['invoice_date']) ?? ""}"
      },
      {
        "id": "003",
        "label": "Due by",
        "value": "${getDateInSring(subscriberDetail['due_by'])}"
      },
      {
        "id": "004",
        "label": "Package",
        "value": "${subscriberDetail['location_package_name']}"
      },
      {
        "id": "005",
        "label": "Period",
        "value":
        "${getDateInSring(subscriberDetail['period_from'])}:${getDateInSring(subscriberDetail['period_from'])}"
      },
      {
        "id": "006",
        "label": "Description",
        "value": "${subscriberDetail['adjustment_description'] ?? ""}"
      },
      {
        "id": "007",
        "label": "Invoice Header",
        "value": "${subscriberDetail['invoice_header_text'] ?? ""}"
      },
      {
        "id": "008",
        "label": "Invoice Terms Text",
        "value": "${subscriberDetail['invoice_terms_text'] ?? ""}"
      },
      {
        "id": "009",
        "label": "Footnote",
        "value": "${subscriberDetail['invoice_footnote_text'] ?? ""}"
      },
      {
        "id": "010",
        "label": "Balance Amount Due",
        "value": "${subscriberDetail['subscriber_balance_amount_human']}"
      },
      {
        "id": "011",
        "label": "Total Invoice Amount",
        "value": "${subscriberDetail['total_amount_human']}"
      },
      {
        "id": "012",
        "label": "Amount",
        "value": "${subscriberDetail['total_amount_human']}"
      }
    ];
  }

  String getDateInSring(String data) {
    var string = data.toString().substring(0, 10).toString();
    String due_by = DateFormat('dd-MMM-yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(string));
    return due_by;
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
