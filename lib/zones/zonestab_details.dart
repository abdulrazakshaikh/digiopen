import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ZonesTabDetails extends StatefulWidget {
  @override
  _ZonesTabDetailsState createState() => new _ZonesTabDetailsState();
}

class _ZonesTabDetailsState extends State<ZonesTabDetails> {


List detailsList = [
  {
    "id": "001",
    "label" : "Name",
    "value" : "Dinesh Jain"
  },
  {
    "id": "002",
    "label" : "Service Person",
    "value" : "John Doe"
  },
  {
    "id": "003",
    "label" : "Payment Collector",
    "value" : "info@digitalopeners.com"
    
  },
  {
    "id": "004",
    "label" : "Description",
    "value" : "lorem uo]dnsjkhdsllsa jlalsldsaulojelpoq;asfdposajlsdjlk lpsaopidadsplajl"
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