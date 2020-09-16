import 'package:flutter/material.dart';
import 'package:flutter_app/domain/pokemon.dart';

class PokemonCard extends StatefulWidget {
  PokemonCard({Key key, this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.pokemon.name.substring(0,1).toUpperCase() + widget.pokemon.name.substring(1),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Image.network(widget.pokemon.image, scale: 5),
              /*
              Row(
                children: widget.pokemon.sprites.sublist(0, 2).map((e) => Image.network(e)).toList(),
                mainAxisAlignment: MainAxisAlignment.center,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
