import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wrv_catalog/components/boards_tile.dart';
import 'package:wrv_catalog/models/board.dart';
import 'dart:convert';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Board> performanceBoards = [];
  List<Board> alternativeBoards = [];
  List<Board> midlengthBoards = [];
  List<Board> longBoards = [];

  @override
  void initState() {
    super.initState();
    _loadBoards();
  }

  Future<void> _loadBoards() async {
    final String response = await rootBundle.loadString('assets/boards.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      performanceBoards =
          data
              .map((boardData) => Board.fromJson(boardData))
              .where((board) => board.style == "Performance")
              .toList();
    });
    setState(() {
      alternativeBoards =
          data
              .map((boardData) => Board.fromJson(boardData))
              .where((board) => board.style == "Alternative")
              .toList();
    });
    setState(() {
      midlengthBoards =
          data
              .map((boardData) => Board.fromJson(boardData))
              .where((board) => board.style == "Mid-length")
              .toList();
    });
    setState(() {
      longBoards =
          data
              .map((boardData) => Board.fromJson(boardData))
              .where((board) => board.style == "Longboard")
              .toList();
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
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 163, 163, 163),
        child: Center(
          child: Column(
            children: [
              DrawerHeader(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/intropage');
                  },
                  child: Icon(Icons.surfing_sharp, size: 45),
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                title: Center(child: Text("C A T A L O G")),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/catalog');
                  if (kDebugMode) {
                    debugPrint('Moving to Catalog');
                  }
                },
              ),
              SizedBox(height: 40),
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
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Logos/nordwood-themes-background2.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 2,
                        margin: EdgeInsets.only(left: 50),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Image.asset(
                          'assets/images/Logos/blackLogo.png',
                          height: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 2,
                        margin: EdgeInsets.only(right: 50),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Boards Catalog",
                style: GoogleFonts.marcellusSc(fontSize: 38),
              ),

              // PERFORMANCE BOARDS AREA
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Performance",
                      style: GoogleFonts.marcellusSc(fontSize: 26),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 1,
                        margin: EdgeInsets.only(top: 2, left: 30, right: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      "At WRV, the love of surfing and board building is at the heart and soul of what we do.",
                      style: GoogleFonts.marcellus(fontSize: 18),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              performanceBoards.isEmpty
                  ? CircularProgressIndicator()
                  : Container(
                    color: const Color.fromARGB(12, 0, 0, 0),
                    child: SizedBox(
                      height: 380,
                      child: ListView.builder(
                        itemCount: performanceBoards.length,
                        scrollDirection: Axis.horizontal,
                        itemExtent: 220,
                        itemBuilder: (context, index) {
                          return BoardsTile(board: performanceBoards[index]);
                        },
                      ),
                    ),
                  ),

              // ALTERNATIVE BOARDS AREA
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Alternatives",
                      style: GoogleFonts.marcellusSc(fontSize: 26),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 1,
                        margin: EdgeInsets.only(top: 2, left: 30, right: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      "At WRV, the love of surfing and board building is at the heart and soul of what we do.",
                      style: GoogleFonts.marcellus(fontSize: 18),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              performanceBoards.isEmpty
                  ? CircularProgressIndicator()
                  : Container(
                    color: const Color.fromARGB(12, 0, 0, 0),
                    child: SizedBox(
                      height: 380,
                      child: ListView.builder(
                        itemCount: alternativeBoards.length,
                        scrollDirection: Axis.horizontal,
                        itemExtent: 220,
                        itemBuilder: (context, index) {
                          return BoardsTile(board: alternativeBoards[index]);
                        },
                      ),
                    ),
                  ),

              // MID LENGTH BOARDS AREA
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Mid-Lengths",
                      style: GoogleFonts.marcellusSc(fontSize: 26),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 1,
                        margin: EdgeInsets.only(top: 2, left: 30, right: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      "At WRV, the love of surfing and board building is at the heart and soul of what we do.",
                      style: GoogleFonts.marcellus(fontSize: 18),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              midlengthBoards.isEmpty
                  ? CircularProgressIndicator()
                  : Container(
                    color: const Color.fromARGB(12, 0, 0, 0),
                    child: SizedBox(
                      height: 380,
                      child: ListView.builder(
                        itemCount: midlengthBoards.length,
                        scrollDirection: Axis.horizontal,
                        itemExtent: 220,
                        itemBuilder: (context, index) {
                          return BoardsTile(board: midlengthBoards[index]);
                        },
                      ),
                    ),
                  ),

              // LONG BOARDS AREA
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Longboards",
                      style: GoogleFonts.marcellusSc(fontSize: 26),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 1,
                        margin: EdgeInsets.only(top: 2, left: 30, right: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      "At WRV, the love of surfing and board building is at the heart and soul of what we do.",
                      style: GoogleFonts.marcellus(fontSize: 18),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              longBoards.isEmpty
                  ? CircularProgressIndicator()
                  : Container(
                    color: const Color.fromARGB(12, 0, 0, 0),
                    child: SizedBox(
                      height: 380,
                      child: ListView.builder(
                        itemCount: longBoards.length,
                        scrollDirection: Axis.horizontal,
                        itemExtent: 220,
                        itemBuilder: (context, index) {
                          return BoardsTile(board: longBoards[index]);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
              Image.asset('assets/images/Logos/blackLogo.png',
              height: 30,),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
