import 'package:flutter/material.dart';
import 'package:true_or_dare_app/pages/spicy_home_page.dart';
import 'package:true_or_dare_app/pages/classic_home_page.dart';

import 'easy_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        '/spicy_home_page': (context)=> const SpicyHomePage(),
        '/classic_home_page': (context)=> const ClassicHomePage(),
      },
    );
  }
}
