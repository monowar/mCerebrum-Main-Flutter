import 'package:flutter/material.dart';
import 'package:mcerebrum_main_flutter/utils/uidata.dart';
import 'package:mcerebrum_main_flutter/utils/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:mcerebrum_main_flutter/ui/page/home/home_page.dart';
import 'package:mcerebrum_main_flutter/ui/page/settings/settings.dart';
import 'package:mcerebrum_main_flutter/ui/page/server/login/login_page.dart';
import 'package:mcerebrum_main_flutter/ui/page/server/server_page.dart';

import 'package:mcerebrum_main_flutter/ui/page/main_page.dart';
import 'package:mcerebrum_main_flutter/ui/page/notfound/notfound_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: MainPage(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{

        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.settingsRoute: (BuildContext context) => Settings(),
        UIData.loginRoute: (BuildContext context) => LoginPage(),
        UIData.serverRoute: (BuildContext context) => ServerPage(),

/*
        UIData.profileOneRoute: (BuildContext context) => ProfileOnePage(),
        UIData.profileTwoRoute: (BuildContext context) => ProfileTwoPage(),
        UIData.timelineOneRoute: (BuildContext context) => TimelineOnePage(),
        UIData.timelineTwoRoute: (BuildContext context) => TimelineTwoPage(),
        UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        UIData.settingsOneRoute: (BuildContext context) => SettingsOnePage(),
        UIData.shoppingOneRoute: (BuildContext context) => ShoppingOnePage(),
        UIData.shoppingTwoRoute: (BuildContext context) =>
            ShoppingDetailsPage(),
        UIData.shoppingThreeRoute: (BuildContext context) =>
            ProductDetailPage(),
        UIData.loginOneRoute: (BuildContext context) => LoginPage(),
        UIData.loginTwoRoute: (BuildContext context) => LoginTwoPage(),
        UIData.paymentOneRoute: (BuildContext context) => CreditCardPage(),
        UIData.paymentTwoRoute: (BuildContext context) => PaymentSuccessPage(),
        UIData.dashboardOneRoute: (BuildContext context) => DashboardOnePage(),
        UIData.dashboardTwoRoute: (BuildContext context) => DashboardTwoPage(),
*/
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
            appTitle: UIData.coming_soon,
            icon: FontAwesomeIcons.solidSmile,
            title: UIData.coming_soon,
            message: "Under Development",
            iconColor: Colors.green,
          )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}