// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteController on _FavoriteControllerBase, Store {
  Computed<List<Character>>? _$characterFavoritedComputed;

  @override
  List<Character> get characterFavorited => (_$characterFavoritedComputed ??=
          Computed<List<Character>>(() => super.characterFavorited,
              name: '_FavoriteControllerBase.characterFavorited'))
      .value;

  final _$loadingAtom = Atom(name: '_FavoriteControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$characterListAtom =
      Atom(name: '_FavoriteControllerBase.characterList');

  @override
  ObservableList<Character> get characterList {
    _$characterListAtom.reportRead();
    return super.characterList;
  }

  @override
  set characterList(ObservableList<Character> value) {
    _$characterListAtom.reportWrite(value, super.characterList, () {
      super.characterList = value;
    });
  }

  final _$listAllFavoriteHerosAsyncAction =
      AsyncAction('_FavoriteControllerBase.listAllFavoriteHeros');

  @override
  Future listAllFavoriteHeros() {
    return _$listAllFavoriteHerosAsyncAction
        .run(() => super.listAllFavoriteHeros());
  }

  final _$getCharacterDataWrapperAsyncAction =
      AsyncAction('_FavoriteControllerBase.getCharacterDataWrapper');

  @override
  Future getCharacterDataWrapper() {
    return _$getCharacterDataWrapperAsyncAction
        .run(() => super.getCharacterDataWrapper());
  }

  final _$_FavoriteControllerBaseActionController =
      ActionController(name: '_FavoriteControllerBase');

  @override
  dynamic getFavoriteHeroes() {
    final _$actionInfo = _$_FavoriteControllerBaseActionController.startAction(
        name: '_FavoriteControllerBase.getFavoriteHeroes');
    try {
      return super.getFavoriteHeroes();
    } finally {
      _$_FavoriteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
characterList: ${characterList},
characterFavorited: ${characterFavorited}
    ''';
  }
}
