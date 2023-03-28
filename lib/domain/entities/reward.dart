class Reward {
  final int id;
  final int level;
  final String name;
  final String description;
  final String image;
  final String color;
  Reward({
    required this.id,
    required this.level,
    required this.name,
    required this.description,
    required this.image,
    required this.color,
  });

  factory Reward.fromMap(Map<String, dynamic> json) => Reward(
        id: json["id"],
        level: json["level"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        color: json["color"],
      );
}
