class Game {
  final int id;
  final String description;

  Game({required this.id, required this.description});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      description: json['description'] as String,
    );
  }
}
