import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/utils/AppUtils.dart';

class DataUsage extends StatefulWidget {
  Map? subscriberDetail;

  DataUsage({this.subscriberDetail = null});

  @override
  _DataUsageState createState() => _DataUsageState();
}

class _DataUsageState extends State<DataUsage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.subscriberDetail != null) {
      _isOnline = widget.subscriberDetail!['online'].toString() != "false";
    }
  }

  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                  Text(
                    '${widget.subscriberDetail!['name']}',
                    style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).appBarTheme.titleTextStyle),
                  ),
                  SizedBox(height: 3),
                  Container(
                    decoration: BoxDecoration(
                      color: _isOnline == true ? Colors.greenAccent.shade700 : Colors.redAccent.shade700,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      _isOnline == true ? 'Online'.toUpperCase() : 'Offline'.toUpperCase(),
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).appBarTheme.titleTextStyle,
                        fontSize: 11, color: Colors.white, letterSpacing: 1.5,
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
        actions: [
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [

              Card(
                  elevation: 6,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget
                                    .subscriberDetail!['data_used_total_human'],
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Data Data Used : '.toUpperCase(),
                                style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelLarge,
                                    fontSize: 13,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                          'bytes_uploaded_total_human'],
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Uploaded ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                          'bytes_downloaded_total_human'],
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Downloaded ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  )
              ),

              SizedBox(height: 15),

              Card(
                  elevation: 6,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget
                                    .subscriberDetail!['data_used_today_human'],
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Total Used Today : '.toUpperCase(),
                                style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelLarge,
                                    fontSize: 13,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                              'bytes_uploaded_in_24_hours_human'] ??
                                          "NA",
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Uploaded ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                          'bytes_downloaded_in_24_hours_human'],
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Downloaded ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                              'package_time_used_today'] ??
                                          "NA",
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Hours Used ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  )
              ),

              SizedBox(height: 15),

              Card(
                  elevation: 6,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.subscriberDetail![
                                    'data_used_monthly_human'],
                                style: GoogleFonts.robotoCondensed(
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Data Used Monthly : '.toUpperCase(),
                                style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelLarge,
                                    fontSize: 13,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600
                                ),
                              ),

                            ],
                          ),
                        ),
                        true
                            ? Container()
                            : Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            AppUtils.appToast("Coming Soon");
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            textStyle: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  letterSpacing: 1.25,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Current Usage'),
                                              SizedBox(width: 3),
                                        Icon(Icons.arrow_forward_outlined, size: 18,),
                                      ],
                                    )

                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: OutlinedButton(
                                          onPressed: () {
                                            AppUtils.appToast("Coming Soon");
                                          },
                                          style: OutlinedButton.styleFrom(
                                            // backgroundColor: Theme.of(context).colorScheme.primary,
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                            textStyle: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  letterSpacing: 1.25,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('All Previous Usage'),
                                        SizedBox(width: 3),
                                        Icon(Icons.arrow_forward_outlined, size: 18,),
                                      ],
                                    )
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                          'bytes_uploaded_monthly_human'],
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Uploaded ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.subscriberDetail![
                                          'bytes_downloaded_monthly_human'],
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Downloaded ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'NA',
                                      style: GoogleFonts.robotoCondensed(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text('Hours Used ',
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  )
              )


            ],
          ),
        ),
      ),
    );
  }
}
