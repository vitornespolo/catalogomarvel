import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/private/favorite/favorite_controller.dart';
import 'package:marvelcatalogo/app/modules/private/favorite/favorite_page.dart';

class FavoriteModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FavoriteController(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => FavoritePage()),
  ];
}
