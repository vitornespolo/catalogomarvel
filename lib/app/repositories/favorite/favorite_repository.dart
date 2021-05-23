import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marvelcatalogo/app/core/models/favorite_hero.dart';
import 'package:marvelcatalogo/app/repositories/favorite/favorite_repository_interface.dart';

class FavoriteRepository implements IFavoriteRepository {
  final FirebaseFirestore firebaseFirestore;
  FavoriteRepository({required this.firebaseFirestore});

  @override
  Future<List<FavoriteHero>> findAllFavorite() async {
    QuerySnapshot querySnapshot =
        await this.firebaseFirestore.collection('favoritos').get();
    return querySnapshot.docs
        .map((QueryDocumentSnapshot doc) => FavoriteHero.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<void> save(FavoriteHero favoriteHero) async {
    await this
        .firebaseFirestore
        .collection('favoritos')
        .add(favoriteHero.toMap());
  }
}
