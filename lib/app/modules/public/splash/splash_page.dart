import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/public/splash/splash_controller.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/background_widget.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/opacity_widget.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    controller.verificaUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(),
    );
  }

  Observer _createBody() {
    return Observer(builder: (_) {
      if (controller.error) {
        return Center(
          child: Text('Deu proagro!'),
        );
      }

      if (!controller.initialized) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return _createPage();
    });
  }

  Stack _createPage() {
    return Stack(
      children: [
        BackgroundWidget(),
        OpacityWidget(),
        _createTitle(context),
        _createActions(context),
      ],
    );
  }

  Widget _createTitle(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Catálogo Marvel',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }

  Widget _createActions(BuildContext context) {
    return Positioned(
      bottom: 200,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            width: 200,
            height: 150,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/public/login');
                      },
                      child: Text('Entrar'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    OutlinedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/public/register');
                      },
                      child: Text('Cadastrar-se'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
