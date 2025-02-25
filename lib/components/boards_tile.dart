import 'package:flutter/material.dart';
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
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Image.asset(board.imagePath),
        ],
        // Board
        

        // Model name and shaper
      ),
    );
  }
}