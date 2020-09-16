import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.pokemon.name.substring(0,1).toUpperCase() + widget.pokemon.name.substring(1)),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(widget.pokemon.image),
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 5.0),
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Poids: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Points de vie:", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Attaque: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Défense: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Attaque spéciale: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Défense spéciale: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Vitesse: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  )
                ),
                Expanded(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${widget.pokemon.weight}'),
                      Text('${widget.pokemon.hp}'),
                      Text('${widget.pokemon.attack}'),
                      Text('${widget.pokemon.defense}'),
                      Text('${widget.pokemon.specialAttack}'),
                      Text('${widget.pokemon.specialDefense}'),
                      Text('${widget.pokemon.speed}'),
                    ],
                  )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          CarouselSlider(
            options: CarouselOptions(height: 150, viewportFraction: 0.5),
            items: widget.pokemon.sprites.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey
                      ),
                      child: Image.network(url)
                  );
                },
              );
            }).toList(),
          )
        ]
      )
    );
  }
}
