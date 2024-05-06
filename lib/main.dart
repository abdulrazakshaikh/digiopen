import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xceednet/ui/splashscreen.dart';
import 'package:xceednet/ui/theme/color_schemes.g.dart';
import 'package:xceednet/utils/AppUtils.dart';
import 'package:xceednet/view_model/access_request_view_model.dart';
import 'package:xceednet/view_model/auth_view_model.dart';
import 'package:xceednet/view_model/dashboard_view_model.dart';
import 'package:xceednet/view_model/invoice_view_model.dart';
import 'package:xceednet/view_model/package_view_model.dart';
import 'package:xceednet/view_model/payment_view_model.dart';
import 'package:xceednet/view_model/subscriber_view_model.dart';
import 'package:xceednet/view_model/utils_view_model.dart';

import 'firebase_api.dart';
import 'model/storage/shared_prefs.dart';

Future<void> handleBackgroundNotification(RemoteMessage remoteMessage) async {
  print("Title :${remoteMessage.notification?.title}");
  print("Body :${remoteMessage.notification?.body}");
  print("Payload :${remoteMessage.data}");
}

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? false;
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ThemeNotifier(darkTheme: darkModeOn)),
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => DashboardViewModel()),
          ChangeNotifierProvider(create: (_) => SubscriberViewModel()),
          ChangeNotifierProvider(create: (_) => PackageViewModel()),
          ChangeNotifierProvider(create: (_) => InvoiceViewModel()),
          ChangeNotifierProvider(create: (_) => PaymentViewModel()),
          ChangeNotifierProvider(create: (_) => AccessRequestViewModel()),
          ChangeNotifierProvider(create: (_) => UtilsViewModel()),
          ChangeNotifierProvider(create: (_) => SharedPrefs()),
        ],
        child: MyApp(darkModeOn: darkModeOn),
      ));
      // runApp(MyApp(darkModeOn: darkModeOn,));
    });
  });
}

class MyApp extends StatefulWidget {
  var darkModeOn = true;

  MyApp({this.darkModeOn = true});

  /* static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);*/

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  call();
    SharedPrefs().init();
    AppUtils().getCountries(context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = context.watch<ThemeNotifier>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: SharedPrefs.navigatorKey,
      title: 'Xceednet',
      theme: lightthemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: themeNotifier.darkTheme ? ThemeMode.dark : ThemeMode.light,
      // ThemeMode.dark,
      // ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
