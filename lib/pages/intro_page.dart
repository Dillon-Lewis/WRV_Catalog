import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wrv_catalog/components/boards_tile.dart';
import 'package:wrv_catalog/models/board.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Board> boards = []; // This holds the list of board data

  @override
  void initState() {
    super.initState();
    _loadBoards(); // Load boards data when the page initializes
  }

  // Method used to load the boards data from the JSON file
  Future<void> _loadBoards() async {
    final String response = await rootBundle.loadString('assets/boards.json');
    final List<dynamic> data = json.decode(response);

    // Convert JSON into a list of Board objects
    setState(() {
      boards = data.map((boardData) => Board.fromJson(boardData)).toList();
    });
  }

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
                    debugPrint('Moving to Shapers');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap the whole body in a scrollable view
        child: Column(
          children: [
            // Logo
            Image.asset('assets/images/Logos/squareLogo.png', height: 150),
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

            // Boards horizontal Slider (ListView)
            boards.isEmpty // If boards are not loaded, show a loading spinner
                ? CircularProgressIndicator() // This shows a spinner while boards are being loaded
                : SizedBox(
                    height: 250, // Set the height for the horizontal list view
                    child: ListView.builder(
                      itemCount: boards.length, // Use the length of the boards list
                      scrollDirection: Axis.horizontal,
                      itemExtent: 200, // Set a fixed size for each board tile to improve performance
                      itemBuilder: (context, index) {
                        return BoardsTile(board: boards[index]); // Passing predefined board object to the tile
                      },
                    ),
                  ),
            SizedBox(height: 30),
            // Label below the board list
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hand Crafted Surfboards",
                  style: GoogleFonts.marcellusSc(fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 50), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
