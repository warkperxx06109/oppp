import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final dynamic spot;

  const DetailScreen({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          spot["name"],
          style: GoogleFonts.kodchasan(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/${spot["image"]}',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                spot["name"],
                style: GoogleFonts.kodchasan(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "ประวัติสถานที่",
                style: GoogleFonts.kodchasan(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                spot["description"],
                style: GoogleFonts.kodchasan(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
