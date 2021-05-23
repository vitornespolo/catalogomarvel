import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/auth/auth_controller.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/background_widget.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/opacity_widget.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          OpacityWidget(),
          _createAppbar(),
          _createActions(),
        ],
      ),
    );
  }

  Widget _createAppbar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
    );
  }

  Widget _createActions() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Aqui vai ficar o nome'),
              Text('Aqui vai ficar o email'),
              Text('Aqui vai ficar a senha'),
              ElevatedButton(
                onPressed: () {
                  print('Aqui vai registrar o usuário');
                },
                child: Text('Cadastrar-se'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              _createDivider(),
              OutlinedButton(
                onPressed: () {
                  _loginWithGoogle();
                },
                child: Text('Entrar com Google'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDivider() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(child: Divider()),
          Text(
            '  ou  ',
            textAlign: TextAlign.center,
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }

  _loginWithGoogle() async {
    await authController.loginWithGoogle();
    if (authController.status == AuthStatus.login) {
      Modular.to.navigate('/private/home', replaceAll: true);
    }
  }
}
