import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketTabDetails extends StatefulWidget {
  @override
  _TicketTabDetailsState createState() => new _TicketTabDetailsState();
}

class _TicketTabDetailsState extends State<TicketTabDetails> {


List detailsList = [
  {
    "id": "001",
    "label" : "Ticket Number",
    "value" : "#12346579"
  },
  {
    "id": "002",
    "label" : "Subscriber",
    "value" : "John Doesha"
  },
  {
    "id": "003",
    "label" : "Person Called",
    "value" : "John Wilson Doe"
  },
  {
    "id": "004",
    "label" : "Zone",
    "value" : "-"
  },
  {
    "id": "005",
    "label" : "Assigned To",
    "value" : "-"
  },
  {
    "id": "006",
    "label" : "Priority",
    "value" : "Low"
  },
  {
    "id": "007",
    "label" : "Created at",
    "value" : "22-Sep-2022 10:28 PM"
  },
  {
    "id": "008",
    "label" : "Due By",
    "value" : "23-Sep-2022 11:59 PM"
  },
  {
    "id": "009",
    "label" : "Status",
    "value" : "Open"
  },
  {
    "id": "010",
    "label" : "Subject",
    "value" : "No Internet Connection"
  },
  {
    "id": "011",
    "label" : "Description",
    "value" : "lorem ipsum dolor sit amet is simply dummmy text used for typesetting"
  },
];

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