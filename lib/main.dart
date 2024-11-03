import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kamin/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แนะนำสถานที่ท่องเที่ยวอุดรธานี',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.charmTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
