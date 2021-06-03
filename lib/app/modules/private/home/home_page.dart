import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/auth/auth_controller.dart';
import 'package:marvelcatalogo/app/modules/private/home/home_controller.dart';
import 'package:marvelcatalogo/app/modules/private/home/widget/hero_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String filterText = "";

class _HomePageState extends ModularState<HomePage, HomeController> {
  final AuthController authController = Modular.get();
  @override
  void initState() {
    controller.getCharacterDataWrapper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(100, 100),
          child: Observer(
            builder: (_) {
              return AppBar(
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.home_outlined)),
                    Tab(icon: Icon(Icons.favorite_border))
                  ],
                ),
                // Campo de pesquisa no home
                title: controller.mostrarFilter
                    ? TextField(
                        onChanged: controller.setQuery,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar Heroi',
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    : Text('Herois Marvel'),
                backgroundColor: Colors.redAccent,
                actions: [
                  IconButton(
                    icon: controller.mostrarIcon
                        ? Icon(Icons.search)
                        : Icon(Icons.cancel),
                    onPressed: () {
                      print(controller.mostrarIcon);
                      print(controller.mostrarFilter);
                      if (controller.mostrarFilter == false) {
                        controller.alterarMostrarFilter(true);
                        controller.alterarMostrarIcon(false);
                      } else {
                        controller.alterarMostrarFilter(false);
                        controller.alterarMostrarIcon(true);
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.grey[300],
              child: _criaListaHerois(),
            ),
            Center(
              child: Text("Favoritos"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _criaListaHerois() {
    return Observer(builder: (_) {
      if (controller.carregando || controller.characterDataWrapper == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: controller.characterFiltereds.length,
          itemBuilder: (context, i) => HeroCard(
            character: controller.characterFiltereds[i],
          ),
        );
      }
    });
  }
}
