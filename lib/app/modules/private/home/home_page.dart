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
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/images/user.png'),
                ),
                accountName: Text('Usuario'),
                accountEmail: Text('Email do Usuario'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('inicio'),
                subtitle: Text('tela de inicio'),
                onTap: () {
                  print('home');
                  Modular.to.pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                subtitle: Text('Finalizar sessão'),
                onTap: () {
                  Modular.to.navigate('/public/splash', replaceAll: true);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favoritos'),
                subtitle: Text('Herois favoritos'),
                onTap: () {
                  Modular.to.navigate('/private/favorite', replaceAll: true);
                },
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
        preferredSize: Size(50, 50),
        child: Observer(
          builder: (_) {
            return AppBar(
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
        body: Container(
          color: Colors.grey[300],
          child: _criaListaHerois(),
        ));
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
