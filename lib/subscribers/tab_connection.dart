import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabConnection extends StatefulWidget {
  @override
  _TabConnectionState createState() => new _TabConnectionState();
}

class _TabConnectionState extends State<TabConnection> {


List connectionList = [
  {
    "id": "001",
    "label" : "zone",
    "value" : "Sanpada"
  },
  {
    "id": "002",
    "label" : "Node",
    "value" : "Lorem Ipsum"
  },
  {
    "id": "003",
    "label" : "Distance From Node",
    "value" : "10KM"
  },
  {
    "id": "004",
    "label" : "Fix IP Address",
    "value" : false
  },
  {
    "id": "005",
    "label" : "Bind MAC Address",
    "value" : true,
  },
  {
    "id": "006",
    "label" : "MAC Address",
    "value" : "AS5-ASS6-ASS5-AS8-VV7"
  },
  {
    "id": "007",
    "label" : "Reset MAC Address",
    "value" : true
  },
  {
    "id": "008",
    "label" : "Leased Line Subscriber",
    "value" : false
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
                    child: Text('${item["label"]} : '.toLowerCase(),
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