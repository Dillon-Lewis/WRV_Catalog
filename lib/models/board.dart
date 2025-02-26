class Board{
  final String model;
  final String shaper;
  final String frontImage;
  final String backImage;

  Board({required this.model, required this.shaper, required this.frontImage, required this.backImage});
  
  // Factory Method to create Board from Json Data

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(model: json['model'], shaper: json['shaper'], frontImage: json['frontImage'], backImage: json['backImage'],);
  }

   //Convery Board object back into Json data

  Map<String, dynamic> toJson(){
    return{
      'model' : model,
      'shaper' : shaper,
      'frontImage': frontImage,
      'backImage': backImage,
    };
  }
  }