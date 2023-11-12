import 'package:alice/alice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core/routes/app_route_config.dart';
import '../di/dependency_registry.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  int appState = 0;
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.returnRouter(true, _navigatorKey!),
        theme: getApplicationTheme());
  }

  final GlobalKey<NavigatorState>? _navigatorKey = kReleaseMode
      ? GlobalKey<NavigatorState>() : instance.get<Alice>().getNavigatorKey();
}
