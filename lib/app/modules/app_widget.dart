import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caltálogo Marvel',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/public/splash',
    ).modular();
  }
}
