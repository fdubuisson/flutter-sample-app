
class Pokemon {
  final int id;
  final String name;
  final List<String> sprites;

  Pokemon({this.id, this.name, this.sprites});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<String> spriteKeys = ["front_default", "front_shiny"];
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprites: spriteKeys.map((e) => json['sprites'][e] as String).where((element) => element != null).toList()
    );
  }
}
