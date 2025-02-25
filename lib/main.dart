import 'package:flutter/material.dart';
import 'package:wrv_catalog/pages/catalog.dart';
import 'package:wrv_catalog/pages/intro_page.dart';
import 'package:wrv_catalog/pages/meet_the_shapers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        routes: {
          '/intropage' :(context) => IntroPage(),
          '/catalog' :(context) => Catalog(),
          '/shapers' :(context) => MeetTheShapers(),
        },
    );
  }
}