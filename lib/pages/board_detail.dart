import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wrv_catalog/models/board.dart';

class BoardDetail extends StatelessWidget {
  final Board board;

  const BoardDetail({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(backgroundColor: Color.fromARGB(255, 231, 231, 231)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
//HEADER
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
            Center(
              child: Text(
                board.model,
                style: GoogleFonts.marcellusSc(fontSize: 34),
              ),
            ),
//BOARDS DETAILS
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(board.shaper,
                style: GoogleFonts.marcellus(fontSize: 25),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
