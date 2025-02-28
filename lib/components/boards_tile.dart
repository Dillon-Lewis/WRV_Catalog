import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/board.dart';

// ignore: must_be_immutable
class BoardsTile extends StatelessWidget {
  Board board;
  BoardsTile({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              board.frontImage, 
              height: 300,
                          ),
          ),
          SizedBox(height: 8), 
          
          Text(
            board.model,
            style: GoogleFonts.marcellusSc(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Display the shaper name (in regular style)
          Text(
            board.shaper,
            style: GoogleFonts.marcellusSc(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
