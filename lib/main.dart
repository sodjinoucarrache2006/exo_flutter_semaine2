import 'package:flutter/material.dart';
import 'package:restau/core/theme.dart';
import 'package:restau/navigation/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Mon Resto',
      home: const BottomNavEcran(),
    );
  }
}


