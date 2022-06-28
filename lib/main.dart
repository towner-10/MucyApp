import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MucyApp()
    ));
}

class MucyApp extends StatelessWidget {

  final MucyRouter _autoRouter = locator<MucyRouter>();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/fonts/montserrat/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    return GetMaterialApp.router(
      routerDelegate: AutoRouterDelegate(_autoRouter),
      routeInformationParser: _autoRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, extendedNav) => Theme(
        data: ThemeData.light().copyWith(
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent)
        ),
        child: extendedNav!,
      )
    );
  }
}