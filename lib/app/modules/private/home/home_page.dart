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
            children: [
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
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Sessão de Herois'),
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
          itemCount: controller.characterDataWrapper?.data.results.length,
          itemBuilder: (context, i) => HeroCard(
            character: controller.characterDataWrapper?.data.results[i],
          ),
        );
      }
    });
  }
}
