import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wrv_catalog/components/boards_tile.dart';
import 'package:wrv_catalog/models/board.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 163, 163, 163),
        child: Center(
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.surfing_sharp, size: 45)),
              ListTile(
                title: Text("C A T A L O G"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/catalog');
                  if (kDebugMode) {
                    debugPrint('Moving to Catalog');
                  }
                },
              ),
              ListTile(
                title: Text("S H A P E R S"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shapers');
                  if (kDebugMode) {
                    debugPrint('Moving to Catalog');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            //Logo
            Image.asset('assets/images/sqaureLogo.png', height: 150,),
            Text(
              "Wave Riding Vehicles",
              style: GoogleFonts.marcellusSc(fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Shapers of the Revolution",
                style: GoogleFonts.marcellus(fontSize: 22),
              ),
            ),
            SizedBox(height: 30),

            //Boards vertical Slider
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Board board = Board(model: "El Jefe", shaper: "Bob Yinger", imagePath: 'assets/images/sqaureLogo.png');
                  return BoardsTile(board: board);
                },
              ),
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hand Crafted Surfboards",
                  style: GoogleFonts.marcellusSc(fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
