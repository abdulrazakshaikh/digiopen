import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabDetails extends StatefulWidget {
  @override
  _TabDetailsState createState() => new _TabDetailsState();
}

class _TabDetailsState extends State<TabDetails> {


List detailsList = [
  {
    "id": "001",
    "label" : "customerid",
    "value" : "XC0001"
  },
  {
    "id": "002",
    "label" : "Account",
    "value" : "lorem"
  },
  {
    "id": "003",
    "label" : "Name",
    "value" : "John Wilson Doe"
  },
  {
    "id": "004",
    "label" : "Username",
    "value" : "johndoe"
  },
  {
    "id": "005",
    "label" : "Phone",
    "value" : "-"
  },
  {
    "id": "006",
    "label" : "Mobile",
    "value" : "9876543210"
  },
  {
    "id": "007",
    "label" : "Email",
    "value" : "john@gmail.com"
  },
  {
    "id": "008",
    "label" : "Address Line",
    "value" : "302 Plot - 111, Sector - 420"
  },
  {
    "id": "009",
    "label" : "City",
    "value" : "Mumbai"
  },
  {
    "id": "010",
    "label" : "State",
    "value" : "Maharashtra"
  },
  {
    "id": "011",
    "label" : "Country",
    "value" : "India"
  },
  {
    "id": "012",
    "label" : "Zipcode",
    "value" : "400706"
  },
  {
    "id": "013",
    "label" : "Hotspot Subscriber",
    "value" : false,
  },
  {
    "id": "014",
    "label" : "Blocked",
    "value" : false,
  },
  {
    "id": "015",
    "label" : "Auto Renew",
    "value" : true,
  },
  {
    "id": "016",
    "label" : "Sticky Password",
    "value" : false,
  },
  {
    "id": "017",
    "label" : "Subscriber Since",
    "value" : "20 Sep, 2021"
  },
  {
    "id": "018",
    "label" : "Type",
    "value" : "Residential"
  },
  {
    "id": "019",
    "label" : "Discount",
    "value" : "0%"
  },
  {
    "id": "020",
    "label" : "Note",
    "value" : "lorem ipsum dolor sit amet is a simly text used for typesetting"
  },
  {
    "id": "021",
    "label" : "GST Number",
    "value" : "-"
  },

];

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