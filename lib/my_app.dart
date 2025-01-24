import 'package:flutter/material.dart';
import 'package:localizer/utils/nav_routes.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: NavRoutes.home,
      routes: {
        NavRoutes.home: (context) => const HomePage(),
        NavRoutes.second: (context) => const HomePage(),
      },
    );
  }
}