import 'package:flutter/material.dart';
import 'package:flutter_app/domain/pokemon.dart';
import 'package:flutter_app/data_access/pokemons.dart';
import 'package:flutter_app/screens/pokemon_card.dart';
import 'package:flutter_app/screens/details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> _pokemons = List<Pokemon>();

  @override
  initState() {
    super.initState();

    listPokemons(0, 20).then((pokemons) => // TODO: paging
      setState(() {
        _pokemons = pokemons;
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(pokemon: _pokemons[index])),
                  );
                });
              },
              child: PokemonCard(
                pokemon: _pokemons[index],
              ),
            )
          );
        }
      ),
    );
  }
}
