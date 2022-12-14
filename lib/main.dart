import 'package:flutter/material.dart';
import 'package:todo/landing_page.dart';
import 'package:todo/ui/theme/color_scheme.dart';
import 'package:todo/ui/theme/type.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: const LandingPage(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: materialTextTheme()),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: materialTextTheme()),
      //themeMode: EasyDynamicTheme.of(context).themeMode,
      debugShowCheckedModeBanner: false,
      //routerDelegate: _appRouter.delegate(),
      //routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
