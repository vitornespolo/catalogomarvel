import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/models/character.dart';
import 'package:marvelcatalogo/app/core/widgets/my_hero_widget.dart';
import 'package:marvelcatalogo/app/modules/private/detalhes/detalhe_controller.dart';

class DetalhesPage extends StatefulWidget {
  final Character character;

  const DetalhesPage({Key? key, required this.character}) : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends ModularState<DetalhesPage, DetalheController> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.character.name,
                  style: TextStyle(color: Colors.black)),
              background: MyHeroWidget(
                tag: widget.character.id,
                child: Image.network(
                  widget.character.thumbnail.caminhoCompleto,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _criaDetalhesHeroi()
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: ButtonBar(
      //     alignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       _criaBotaoBottomBar('Pinned', _pinned, onChanged: (value) {
      //         setState(() {
      //           _pinned = value;
      //         });
      //       }),
      //       _criaBotaoBottomBar('Snap', _snap, onChanged: (value) {
      //         setState(() {
      //           _snap = value;
      //           _floating = _floating || _snap;
      //         });
      //       }),
      //       _criaBotaoBottomBar('Floating', _floating, onChanged: (value) {
      //         setState(() {
      //           _floating = value;
      //           _snap = _snap || _floating;
      //         });
      //       })
      //     ],
      //   ),
      // ),
    );
  }

  // Row _criaBotaoBottomBar(String label, bool value,
  //     {void Function(bool)? onChanged}) {
  //   return Row(
  //     children: [
  //       Text(label),
  //       Switch(value: value, onChanged: onChanged),
  //     ],
  //   );
  // }

  SliverList _criaDetalhesHeroi() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _criaContainerConteudo(
            'Descrição :',
            color: Colors.black38,
            child: Text(
              widget.character.description,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Divider(),
          _criaContainerConteudo(
            'Commics :',
            color: Colors.black,
            child: Wrap(
              children: widget.character.comics.items
                  .map((e) => Text(e.name, style: TextStyle(color: Colors.red),))
                  .toList(),
            ),
          ),
          Divider(),
          _criaContainerConteudo(
            'Events :',
            color: Colors.black38,
            child: Wrap(
              children: widget.character.events.items
                  .map((e) => Text(e.name, style: TextStyle(color: Colors.red),))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Container _criaContainerConteudo(String titulo,
      {required Widget child, Color? color}) {
    return Container(
      color: color,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: TextStyle(color: Colors.redAccent, fontSize: 20)
              //Theme.of(context).textTheme.headline6,
              ),
          child
        ],
      ),
    );
  }
}
