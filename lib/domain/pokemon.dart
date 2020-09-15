
class Pokemon {
  final int id;
  final String name;
  final List<String> sprites;

  Pokemon({this.id, this.name, this.sprites});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprites: [
        json['sprites']["front_default"],
        //json['sprites']["back_default"],
        json['sprites']["front_shiny"],
        //json['sprites']["back_shiny"],
      ]
    );
  }
}
