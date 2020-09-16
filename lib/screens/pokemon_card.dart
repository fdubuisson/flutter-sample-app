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
      height: 200.0,
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 180,
                decoration:BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.pokemon.image),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                widget.pokemon.name.substring(0,1).toUpperCase() + widget.pokemon.name.substring(1),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
