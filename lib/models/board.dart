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
  final List<Dimensions> dimensions;

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
    required this.dimensions,
  });

  // Factory method to create a Board from JSON
  factory Board.fromJson(Map<String, dynamic> json) {
    var dimensionsList = json['dimensions'] as List;
    List<Dimensions> dimensions = dimensionsList
        .map((dimension) => Dimensions.fromJson(dimension))
        .toList();

    return Board(
      model: json['model'],
      shaper: json['shaper'],
      frontImage: json['frontImage'],
      backImage: json['backImage'],
      style: json['style'] ?? 'NA',
      details: json['details'],
      finConfig: json['finConfig'],
      stringer: json['stringer'],
      tail: json['tail'],
      concave: json['concave'],
      material: json['material'],
      dimensions: dimensions,
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
      'dimensions': dimensions.map((dimension) => dimension.toJson()).toList(),  // Convert list of dimensions to JSON
    };
  }

  // Override toString for debugging
  @override
  String toString() {
    return 'Board(model: $model, shaper: $shaper)';
  }
}

class Dimensions {
  final String length;
  final String width;
  final String thickness;
  final String volume;

  Dimensions({
    required this.length,
    required this.width,
    required this.thickness,
    required this.volume,
  });

  // Factory method to create a Dimension from JSON
  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'] ?? 'N/A',
      width: json['width'] ?? 'N/A',
      thickness: json['thickness'] ?? 'N/A',
      volume: json['volume'] ?? 'N/A',
    );
  }

  // Convert Dimensions object back into JSON data
  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'width': width,
      'thickness': thickness,
      'volume': volume,
    };
  }

  // Override toString for debugging
  @override
  String toString() {
    return 'Dimensions(length: $length, width: $width, thickness: $thickness, volume: $volume)';
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
