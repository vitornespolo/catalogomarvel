import 'dart:convert';

class FavoriteHero {
  int? id;

  FavoriteHero({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'favoriteHeroId': id,
    };
  }

  factory FavoriteHero.fromMap(Map<String, dynamic> map) {
    return FavoriteHero(
      id: map['favoriteHeroId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteHero.fromJson(String source) =>
      FavoriteHero.fromMap(json.decode(source));
}
