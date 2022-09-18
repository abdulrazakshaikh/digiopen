import 'package:digiopeners/dashboard.dart';
import 'package:digiopeners/profile/profile.dart';
import 'package:digiopeners/splashscreen.dart';
import 'package:digiopeners/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            title: 'Digiopeners',
            theme: lightthemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: 
            currentMode,
            // ThemeMode.dark,
            // ThemeMode.light,
            home: 
            // SplashScreen(),
            // const Dashboard(title: 'Dashboard')
            const Profile(title: 'Profile')
          );
        });
  }
}
