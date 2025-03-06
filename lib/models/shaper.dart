// class Shaper {
//   final String firstName;
//   final String lastName;
//   final String shortBio;
//   final String headshot;
//   final List<Models> models;


//   Shaper({
//     required this.firstName,
//     required this.lastName,
//     required this.shortBio,
//     required this.headshot,
//     required this.models,
//   });

//   factory Shaper.fromJson(Map<String, dynamic> json) {
//     var modelsList = json['models'] as List;
//     List<Models> models = modelsList
//       .map((model) => Models.fromJson(model)).toList();
//   }



// }
