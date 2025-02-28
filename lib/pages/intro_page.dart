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
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            children: [
              DrawerHeader(child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/intropage');
                  },
                  child: Icon(Icons.surfing_sharp, size: 45),
                ),
              ),

              SizedBox(height: 40,),
              ListTile(
                title: Center(child: Text("C A T A L O G",)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/catalog');
                  if (kDebugMode) {
                    debugPrint('Moving to Catalog');
                  }
                },
              ),
              SizedBox(height: 40,),
              ListTile(
                title: Center(child: Text("S H A P E R S")),
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
      body: SingleChildScrollView(
        // Wrap the whole body in a scrollable view
        child: Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Logos/blackLogo.png',
                height: 150,
              ),
            ),
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

            // Boards horizontal Slider 
            boards
                    .isEmpty // If boards are not loaded, show a loading spinner
                ? CircularProgressIndicator() 
                : Container(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  child: SizedBox(
                    height: 375, // Set the height for the horizontal list view
                    child: ListView.builder(
                      itemCount:5, 
                      scrollDirection: Axis.horizontal,
                      itemExtent: 220,
                      itemBuilder: (context, index) {
                        return BoardsTile(
                          board: boards[index],
                        ); // Passing predefined board object to the tile
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/catalog');
                      if (kDebugMode) {
                        debugPrint('Moving to Catalog');
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // reduces tap area
                      backgroundColor: Colors.transparent,
                      alignment: Alignment.topRight,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          'Full Catalog',
                          style: GoogleFonts.marcellus(fontSize: 16,
                          color: const Color.fromARGB(255, 135, 135, 135),
                          decoration: TextDecoration.underline,
                          decorationThickness: .8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Label below the board list
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "At WRV, the love of surfing and board building is at the heart and soul of what we do.",
                    style: GoogleFonts.marcellus(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
