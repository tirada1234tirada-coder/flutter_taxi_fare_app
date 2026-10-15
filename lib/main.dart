import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    _FlutterTaxiFareappState(),
  );
}

class _FlutterTaxiFareappState extends StatefulWidget {
  const _FlutterTaxiFareappState({super.key});

  @override
  State<_FlutterTaxiFareappState> createState() => __FlutterTaxiFareappStateState();
}

class __FlutterTaxiFareappStateState extends State<_FlutterTaxiFareappState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}