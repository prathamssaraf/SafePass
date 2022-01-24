import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safepass/log_in/login_page.dart';
import 'package:safepass/opening_page/opening_page.dart';
import 'credit/page/card_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        initialRoute: 'SplashScreen',
        routes: {
          'login': (context) => LoginPage(),
          'SplashScreen': (context) => OpeningScreen(),
        },
      );
}
