
class Pokemon {
  final int id;
  final String name;
  final int weight;

  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  final String image;
  final List<String> sprites;

  Pokemon({this.id, this.name, this.weight, this.hp, this.attack, this.defense, this.specialAttack, this.specialDefense, this.speed, this.image, this.sprites});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<String> spriteKeys = ["front_default", "back_default", "front_shiny", "back_shiny", "front_female", "back_female"];
    final Map<String, int> stats = Map.fromIterable(
        json["stats"] as List,
        key: (json) => json["stat"]["name"] as String,
        value: (json) => json["base_stat"] as int
    );

    return Pokemon(
      id: json['id'],
      name: json['name'],
      weight: json["weight"],
      hp: stats["hp"],
      attack: stats["attack"],
      defense: stats["defense"],
      specialAttack: stats["special-attack"],
      specialDefense: stats["special-defense"],
      speed: stats["speed"],
      image: json["sprites"]["other"]["official-artwork"]["front_default"] as String,
      sprites: spriteKeys.map((e) => json['sprites'][e] as String).where((element) => element != null).toList()
    );
  }
}
