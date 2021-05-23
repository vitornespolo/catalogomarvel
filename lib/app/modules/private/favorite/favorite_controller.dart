import 'package:marvelcatalogo/app/core/models/character.dart';
import 'package:marvelcatalogo/app/core/models/favorite_hero.dart';
import 'package:marvelcatalogo/app/repositories/character/character_repository.dart';
import 'package:marvelcatalogo/app/repositories/favorite/favorite_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  final IFavoriteRepository repository;
  final CharacterRepository heroRepository;
  _FavoriteControllerBase(this.repository, this.heroRepository);

  @observable
  bool loading = false;

  @observable
  ObservableList<Character> characterList = ObservableList();

  @computed
  List<Character> get characterFavorited => characterList;

  @action
  getFavoriteHeroes() {
    this.loading = true;
    print('getFavoriteHeroes');
  }

  showLoading() => this.loading = true;

  hideLoading() => this.loading = false;

  changeFavoriteList(List<Character> list) {
    print(list[0].name);
    this.characterList = list.asObservable();
  }

  @action
  listAllFavoriteHeros() async {
    return await repository.findAllFavorite();
  }

  @action
  getCharacterDataWrapper() async {
    showLoading();
    final response = await this.heroRepository.get(null);
    List<Character> list = response.data.results;
    List<Character> listFavorite = [];
    List<FavoriteHero> id = await repository.findAllFavorite();
    print(id[0].id);
    print(list[0].id);
    for (var favorite in id) {
      for (var hero in list) {
        if (favorite.id == hero.id) {
          listFavorite.add(hero);
        }
      }
    }
    changeFavoriteList(listFavorite);
    print(listFavorite);
    this.loading = false;
  }
}