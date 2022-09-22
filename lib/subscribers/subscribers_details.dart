import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribersDetails extends StatefulWidget {
  const SubscribersDetails({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<SubscribersDetails> createState() => _SubscribersDetailsState();
}

class _SubscribersDetailsState extends State<SubscribersDetails> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title.toUpperCase()),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 42, height: 42,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/default.jpg'),
                  radius: 60,
                ),
              ),
              SizedBox(width: 10),
              Text('Augustus Harrell',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleLarge,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              ),
            ],
          ),
        ),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Subscribers Details', textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
