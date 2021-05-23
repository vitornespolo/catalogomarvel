import 'package:marvelcatalogo/app/core/models/favorite_hero.dart';

abstract class IFavoriteRepository {
  Future<List<FavoriteHero>> findAllFavorite();
  Future<void> save(FavoriteHero favoriteHero);
}
