import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadTabDetails extends StatefulWidget {
  @override
  _LeadTabDetailsState createState() => new _LeadTabDetailsState();
}

class _LeadTabDetailsState extends State<LeadTabDetails> {


List detailsList = [
  {
    "id": "001",
    "label" : "Lead ID",
    "value" : "#12346579"
  },
  {
    "id": "002",
    "label" : "Lead Date",
    "value" : "23-Sep-2022"
  },
  {
    "id": "003",
    "label" : "Name",
    "value" : "John Wilson Doe"
  },
  {
    "id": "004",
    "label" : "Assigned To",
    "value" : "John Singh"
  },
  {
    "id": "005",
    "label" : "Address",
    "value" : "Vashi"
  },
  {
    "id": "006",
    "label" : "City",
    "value" : "Mumbai"
  },
  {
    "id": "007",
    "label" : "State",
    "value" : "Maharashtra"
  },
  {
    "id": "008",
    "label" : "Zip",
    "value" : "400704"
  },
  {
    "id": "009",
    "label" : "Phone 1",
    "value" : "-"
  },
  {
    "id": "010",
    "label" : "Mobile",
    "value" : "9876543210"
  },
  {
    "id": "011",
    "label" : "Email",
    "value" : "johndoe@gmail.com"
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
                    child: Text('${item["value"]}',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
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