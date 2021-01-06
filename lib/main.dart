import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return MaterialApp(
      builder: ExtendedNavigator.builder<MucyRouter>(
        router: MucyRouter(),
        initialRoute: Routes.startupView,
        navigatorKey: locator<NavigationService>().navigatorKey,
        builder: (context, extendedNav) => Theme(
          data: ThemeData.light().copyWith(
            bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent)
          ),
          child: extendedNav,
        )
      ),
    );
  }
}