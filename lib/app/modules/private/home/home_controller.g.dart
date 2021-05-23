// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Character>>? _$characterFilteredsComputed;

  @override
  List<Character> get characterFiltereds => (_$characterFilteredsComputed ??=
          Computed<List<Character>>(() => super.characterFiltereds,
              name: '_HomeControllerBase.characterFiltereds'))
      .value;

  final _$characterDataWrapperAtom =
      Atom(name: '_HomeControllerBase.characterDataWrapper');

  @override
  CharacterDataWrapper? get characterDataWrapper {
    _$characterDataWrapperAtom.reportRead();
    return super.characterDataWrapper;
  }

  @override
  set characterDataWrapper(CharacterDataWrapper? value) {
    _$characterDataWrapperAtom.reportWrite(value, super.characterDataWrapper,
        () {
      super.characterDataWrapper = value;
    });
  }

  final _$characterListAtom = Atom(name: '_HomeControllerBase.characterList');

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

  final _$carregandoAtom = Atom(name: '_HomeControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$mostrarFilterAtom = Atom(name: '_HomeControllerBase.mostrarFilter');

  @override
  bool get mostrarFilter {
    _$mostrarFilterAtom.reportRead();
    return super.mostrarFilter;
  }

  @override
  set mostrarFilter(bool value) {
    _$mostrarFilterAtom.reportWrite(value, super.mostrarFilter, () {
      super.mostrarFilter = value;
    });
  }

  final _$mostrarIconAtom = Atom(name: '_HomeControllerBase.mostrarIcon');

  @override
  bool get mostrarIcon {
    _$mostrarIconAtom.reportRead();
    return super.mostrarIcon;
  }

  @override
  set mostrarIcon(bool value) {
    _$mostrarIconAtom.reportWrite(value, super.mostrarIcon, () {
      super.mostrarIcon = value;
    });
  }

  final _$queryAtom = Atom(name: '_HomeControllerBase.query');

  @override
  String? get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String? value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  final _$getCharacterDataWrapperAsyncAction =
      AsyncAction('_HomeControllerBase.getCharacterDataWrapper');

  @override
  Future getCharacterDataWrapper() {
    return _$getCharacterDataWrapperAsyncAction
        .run(() => super.getCharacterDataWrapper());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void alterarMostrarFilter(bool valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.alterarMostrarFilter');
    try {
      return super.alterarMostrarFilter(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarMostrarIcon(bool valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.alterarMostrarIcon');
    try {
      return super.alterarMostrarIcon(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuery(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setQuery');
    try {
      return super.setQuery(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characterDataWrapper: ${characterDataWrapper},
characterList: ${characterList},
carregando: ${carregando},
mostrarFilter: ${mostrarFilter},
mostrarIcon: ${mostrarIcon},
query: ${query},
characterFiltereds: ${characterFiltereds}
    ''';
  }
}
