import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:true_or_dare_app/pages/dare_home_page.dart';
import 'package:true_or_dare_app/pages/truth_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DareHomePage(),
      routes: {
        '/dare_home_page': (context)=> const DareHomePage(),
        '/truth_home_page': (context)=> const TruthHomePage(),
      },
    );
  }
}