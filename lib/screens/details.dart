import 'package:flutter/material.dart';
import 'package:flutter_app/domain/pokemon.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blueGrey,
      child: Image.network(
        widget.pokemon.sprites[1],
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
