import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  final PokemonDataSource _dataSource = PokemonDataSource();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[100]
      ),
      child: PagedListView<int, Pokemon>(
        dataSource: _dataSource,
        builderDelegate: PagedChildBuilderDelegate<Pokemon>(
          itemBuilder: (context, item, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(pokemon: item)),
                  );
                });
              },
              child: PokemonCard(
                pokemon: item,
              ),
            )
          ),
        ),
      ),
    );
  }
}

class PokemonDataSource extends PagedDataSource<int, Pokemon> {
  static const _pageSize = 20;

  PokemonDataSource() : super(0);

  @override
  void fetchItems(int pageKey) {
    listPokemons(pageKey, _pageSize).then((newItems) {
      final hasFinished = newItems.length < _pageSize;
      final nextPageKey =  hasFinished ? null : (pageKey + newItems.length);
      notifyNewPage(newItems, nextPageKey);
    }).catchError((e, stacktrace) {
      print(e);
      print(stacktrace);
      notifyError(e);
    });
  }
}