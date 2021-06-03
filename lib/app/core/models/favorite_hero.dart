import 'dart:convert';

class FavoriteHero {
  String? id;
  int? favoriteHeroId;

  FavoriteHero({
    this.id,
    this.favoriteHeroId,
  });

  Map<String, dynamic> toMap() {
    return {
      'favoriteHeroId': favoriteHeroId,
    };
  }

  factory FavoriteHero.fromMap(Map<String, dynamic> map, String documentId) {
    return FavoriteHero(
      id: documentId,
      favoriteHeroId: map['favoriteHeroId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteHero.fromJson(String source, String documentId) =>
      FavoriteHero.fromMap(json.decode(source), documentId);
}
