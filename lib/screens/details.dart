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
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[100]
      ),
      child: DefaultTextStyle(
        style: new TextStyle(
          inherit: true,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          decorationStyle: TextDecorationStyle.wavy,
          color: Colors.black45),
        child:ListView(
          children: <Widget>[
            Text(widget.pokemon.name.substring(0,1).toUpperCase() + widget.pokemon.name.substring(1), style: TextStyle(fontSize: 65),),
            Image.network(widget.pokemon.image),
            Container(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
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
              options: CarouselOptions(height: 100, viewportFraction: 0.4),
              items: widget.pokemon.sprites.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200]
                      ),
                      child: Image.network(url)
                    );
                  },
                );
              }).toList(),
            )
          ]
        )
      ),
    );
  }
}
