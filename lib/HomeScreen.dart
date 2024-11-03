import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamin/DetailScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> fetchTouristSpots(BuildContext context) async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString('assets/tourist_spots.json');
    return json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สถานที่ท่องเที่ยวในอุดรธานี',
          style: GoogleFonts.kodchasan(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchTouristSpots(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var spot = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/${spot["image"]}',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          spot["name"],
                          style: GoogleFonts.kodchasan(
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          spot["description_short"],
                          style: GoogleFonts.kodchasan(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(spot: spot),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('ไม่พบข้อมูลสถานที่'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
