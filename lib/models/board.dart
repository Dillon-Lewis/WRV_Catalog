import 'dart:convert';
import 'package:flutter/services.dart';

class Board {
  final String model;
  final String shaper;
  final String frontImage;
  final String backImage;
  final String style;
  final String details;
  final String finConfig;
  final String stringer;
  final String tail;
  final String concave;
  final String material;

  // Constructor
  Board({
    required this.model,
    required this.shaper,
    required this.frontImage,
    required this.backImage,
    required this.style,
    required this.details,
    required this.finConfig,
    required this.stringer,
    required this.tail,
    required this.concave,
    required this.material,
  });

  // Factory method to create a Board from JSON
  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      model: json['model'],
      shaper: json['shaper'],
      frontImage: json['frontImage'],
      backImage: json['backImage'],
      style: json['style'],
      details: json['details'],
      finConfig: json['finConfig'],
      stringer: json['stringer'],
      tail: json['tail'],
      concave: json['concave'],
      material: json['material'],
    );
  }

  // Convert Board object back into JSON data
  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'shaper': shaper,
      'frontImage': frontImage,
      'backImage': backImage,
      'style': style,
      'details': details,
      'finConfig': finConfig,
      'stringer': stringer,
      'tail': tail,
      'concave': concave,
      'material': material,
    };
  }

  // Override toString for debugging
  @override
  String toString() {
    return 'Board(model: $model, shaper: $shaper)';
  }
}

class BoardFetcher {
  List<Board> boards = [];

  // Method to load and filter the boards based on style
  Future<void> loadFilteredBoards(String style) async {
    final String response = await rootBundle.loadString('assets/boards.json');
    final List<dynamic> data = json.decode(response);

    // Filter the boards by style
    boards = data
        .map((boardData) => Board.fromJson(boardData))
        .where((board) => board.style == style) // Filter the boards based on the style
        .toList();

    // Print the filtered boards to verify the result
    print('Filtered Boards: $boards');
  }
}
