import 'package:marvelcatalogo/app/core/models/character.dart';
import 'package:marvelcatalogo/app/core/models/character_data_wrapper.dart';
import 'package:marvelcatalogo/app/core/models/favorite_hero.dart';
import 'package:marvelcatalogo/app/repositories/character/character_repository.dart';
import 'package:marvelcatalogo/app/repositories/favorite/favorite_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CharacterRepository repository;
  final IFavoriteRepository favoriteRepository;
  late var immutableCharacterList;

  _HomeControllerBase(this.repository, this.favoriteRepository);

  @observable
  ObservableList<Character> favoritosList = ObservableList();

  @observable
  CharacterDataWrapper? characterDataWrapper;

  @observable
  ObservableList<Character> characterList = ObservableList();

  @observable
  bool carregando = false;

  @observable
  bool mostrarFilter = false;
  @action
  void alterarMostrarFilter(bool valor) => mostrarFilter = valor;

  @observable
  bool mostrarIcon = true;
  @action
  void alterarMostrarIcon(bool valor) => mostrarIcon = valor;

  @action
  getCharacterDataWrapper() async {
    this.carregando = true;
    final response = await this.repository.get(null);
    this.characterDataWrapper = response;
    this.immutableCharacterList = response.data.results;

    List<FavoriteHero> favoritedId = await favoriteRepository.findAllFavorite();
    List<Character> list = [];
    for (var favorite in favoritedId) {
      for (var hero in immutableCharacterList) {
        if (favorite.favoriteHeroId == hero.id) {
          hero.favoritedFirebaseId = favorite.id;
          hero.favorited = true;
          list.add(hero);
        }
      }
    }
    this.favoritosList = list.asObservable();
    changeCharacterList(immutableCharacterList);
    this.carregando = false;
  }

  @observable
  String? query;

  @computed
  List<Character> get characterFiltereds {
    if (query != null && query!.isNotEmpty) {
      return characterList
          .where((character) =>
              character.name.toLowerCase().contains(query!.toLowerCase()))
          .toList();
    }
    return characterList.toList();
  }

  changeCharacterList(List<Character> value) {
    this.characterList = value.asObservable();
  }

  @action
  setQuery(String value) {
    this.query = value;
  }

  @action
  void refrashList() => getCharacterDataWrapper();
}
