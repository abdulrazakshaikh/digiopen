import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketsDetails extends StatefulWidget {
  const TicketsDetails({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<TicketsDetails> createState() => _TicketsDetailsState();
}

class _TicketsDetailsState extends State<TicketsDetails> with TickerProviderStateMixin {
 

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // title: Text(widget.title.toUpperCase()),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 36, height: 36,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/default.jpg'),
                  radius: 60,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elaina Hutton',
                    style: GoogleFonts.roboto(textStyle: Theme.of(context).appBarTheme.titleTextStyle),
                  ),
                  SizedBox(height: 3),
                  Text('9876543210',
                    style: GoogleFonts.roboto(textStyle: Theme.of(context).appBarTheme.titleTextStyle, 
                      fontSize: 12, color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          // IconButton(
          //   tooltip: 'Instant SMS',
          //   onPressed: (){}, 
          //   icon: Icon(Icons.sms_outlined), 
          //   style: IconButton.styleFrom(
          //     shape: RoundedRectangleBorder(),
          //     foregroundColor: Theme.of(context).colorScheme.primary,
          //     minimumSize: Size(54, 54),
          //     fixedSize: Size(54, 54),

          //   ),
          // ),
        ],
      ),
      body: Container(
        
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              height: 150,
              child: Text(
                'TICKETS DETAILS', textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
