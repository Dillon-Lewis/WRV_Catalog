import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wrv_catalog/models/board.dart';

class BoardDetail extends StatefulWidget {
  final Board board;

  const BoardDetail({super.key, required this.board});

  @override
  State<BoardDetail> createState() => _BoardDetailState();
}

class _BoardDetailState extends State<BoardDetail> {

  

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
            //BOARDS DETAILS
            SizedBox(height: 10),
            Center(
              child: Text(
                widget.board.model,
                style: GoogleFonts.marcellusSc(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  widget.board.shaper,
                  style: GoogleFonts.marcellus(fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset(widget.board.frontImage, height: 420)),
                Expanded(child: Image.asset(widget.board.backImage, height: 420)),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: Column(
                children: [
                  Text(
                    widget.board.details,
                    style: GoogleFonts.marcellus(fontSize: 12),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "Specs",
                style: GoogleFonts.marcellusSc(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
