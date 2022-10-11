import 'package:xceednet/accessrequest_log/accessrequest_list.dart';
import 'package:xceednet/dashboard.dart';
import 'package:xceednet/leads/leads_list.dart';
import 'package:xceednet/login/select_location.dart';
import 'package:xceednet/package/package_list.dart';
import 'package:xceednet/profile/profile.dart';
import 'package:xceednet/reports/reports.dart';
import 'package:xceednet/splashscreen.dart';
import 'package:xceednet/subscribers/datausage.dart';
import 'package:xceednet/subscribers/subscribers_add.dart';
import 'package:xceednet/subscribers/subscribers_details.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';
import 'package:xceednet/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xceednet/tickets/tickets_details.dart';
import 'package:xceednet/tickets/tickets_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Xceednet',
            theme: lightthemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: 
            currentMode,
            // ThemeMode.dark,
            // ThemeMode.light,
            home: 
             SplashScreen(),
            //  Dashboard()
            // const Profile(title: 'Profile')
            // SubscribersList()
            // SubscribersDetails()
            // DataUsage()
            // const SubscribersAdd(title: 'Subscribers Add')
            // const Reports(title: 'Reports')
            // TicketsList()
            // TicketsDetails()
            // const LeadsList(title: 'Leads List')
            // const SelectLocation(title: 'Select Location')
          //  PackageList()
          );
        });
  }
}
