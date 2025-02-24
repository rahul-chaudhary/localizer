import 'package:flutter/material.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
