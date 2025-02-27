import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localizer/utils/constants/app_color.dart';
import 'package:localizer/utils/constants/nav_routes.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
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