import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
//import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:semper/binding/binding.dart';
import 'package:semper/components/themes.dart';
import 'package:semper/constants/globals.dart';
import 'package:theme_provider/theme_provider.dart';
import 'route/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  _setupLogging(false);

  runApp(const MyApp());

  if (!Platform.isAndroid) {
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(1000, 600);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      // win.title = "Custom window with Flutter";
      win.show();
    });
  }
}

void _setupLogging(bool enabled) {
  if (enabled) Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
      (rec) => {print("${rec.level.name}: ${rec.time} : ${rec.message}")});
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: 'light_default',
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: themes,
      child: ThemeConsumer(child: Builder(builder: (themeContext) {
        isDarkTheme = ThemeProvider.themeOf(themeContext).id.contains('dark');
        return GetMaterialApp(
          initialBinding: Binding(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          scrollBehavior: MyCustomScrollBehavior(),
          theme: ThemeProvider.themeOf(themeContext).data,
          // darkTheme: CustomTheme.darkTheme,
          // themeMode: currentTheme.currentTheme,
          debugShowCheckedModeBanner: true,
          getPages: Routes.get(),
        );
      })),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
