import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/opacity_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  bool _passwordVisible = true;

  // Alterna o status de exibição da senha
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Widget _bady() {
    print('Chamou o build');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 20, bottom: 12),
                      child: Column(
                        children: <Widget>[
                          //LOGIN
                          TextFormField(
                            onChanged: (text) {
                              _email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.red[300],
                              hintText: 'Login',
                              hintStyle: TextStyle(color: Colors.white),
                              //dimenção do campo
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )),
                            ),
                          ),
                          SizedBox(height: 10),
                          //SENHA
                          TextFormField(
                            onChanged: (text) {
                              _password = text;
                            },
                            obscureText:
                                !_passwordVisible, //Isso irá obscurecer o texto dinamicamente
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.red[300],
                              hintText: 'Senha',
                              hintStyle: TextStyle(color: Colors.white),
                              //dimenção do campo
                              contentPadding: EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Com base no estado _passwordVisible escolha o ícone
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Atualiza o estado, da variável _passwordVisible
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )),
                            ),
                          ),

                          //ACESSAR
                          Container(
                            height: 40,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_email == 'teste@gmail.com' &&
                                      _password == '1234') {
                                    Modular.to.navigate('/private/home',
                                        replaceAll: true);
                                  } else {
                                    print('login invalido');
                                  }
                                },
                                child: Container(
                                  child: Text('ACESSAR',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        OpacityWidget(),
        _bady(),
      ],
    ));
  }
}
