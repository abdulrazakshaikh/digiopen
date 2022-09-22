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
        title: Text(widget.title.toUpperCase()),
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
