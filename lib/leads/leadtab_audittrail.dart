import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';


class LeadTabAuditTrail extends StatefulWidget {
  @override
  _LeadTabAuditTrailState createState() => new _LeadTabAuditTrailState();
}

class _LeadTabAuditTrailState extends State<LeadTabAuditTrail> {

List auditList = [
  {
    "id": "001",
    "icon" : Icons.calendar_month,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title One",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "002",
    "icon" : Icons.people,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Two",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "003",
    "icon" : Icons.create,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "004",
    "icon" : Icons.delete,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "005",
    "icon" : Icons.check,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "006",
    "icon" : Icons.check,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "007",
    "icon" : Icons.check,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "008",
    "icon" : Icons.check,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },
  {
    "id": "009",
    "icon" : Icons.check,
    "date" : "02-Sep-2022",
    "title" : "Lorem Ipsum Title Three",
    "desc" : "lorem ipsum dolor sit amet is a simply dummy text used for typesetting"
  },


];

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(15),
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          direction: Axis.vertical,
          connectorTheme: ConnectorThemeData(thickness: 1.0,color: Theme.of(context).colorScheme.secondary),
          indicatorTheme: IndicatorThemeData(color: Theme.of(context).colorScheme.primary, size: 32,),
        ),
        builder: TimelineTileBuilder.connected(
          contentsAlign: ContentsAlign.basic,
          connectionDirection: ConnectionDirection.after,
          itemCount: auditList == null ? 0 : auditList.length,
          connectorBuilder: (context, index, auditList) {
            return SolidLineConnector(); 
          },
          indicatorBuilder: (context, index) {
            Map item = auditList[index];  
            return DotIndicator(
              child: Icon(item["icon"], size: 18, color: Theme.of(context).colorScheme.onPrimary),
            );
          },
          contentsBuilder: (context, index) {
            Map item = auditList[index];  
            return Card(
              // elevation: 1,
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Theme.of(context).colorScheme.surface),
                borderRadius: BorderRadius.circular(7)
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        )
                      ),
                      
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item["title"]}',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.titleSmall,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2
                          ),
                          ),
                          SizedBox(height: 5),
                          Text('${item["desc"]}',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2
                          ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      alignment: Alignment.bottomRight,
                      child: Text('${item["date"]}'.toUpperCase(),
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelSmall,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ],
                ),
              )
            );
          },
          
        ),
      ),
    );
  }
}