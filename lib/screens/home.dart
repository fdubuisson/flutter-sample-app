import 'package:flutter/material.dart';
import 'package:flutter_app/domain/photo.dart';
import 'package:flutter_app/data_access/photos.dart';
import 'package:flutter_app/screens/photo_card.dart';
import 'package:flutter_app/screens/details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo> _photos = List<Photo>();

  @override
  initState() {
    super.initState();

    fetchPhotos().then((photos) =>
      setState(() {
        _photos = photos.sublist(0, 20);
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
        itemCount: _photos.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(photo: _photos[index])),
                  );
                });
              },
              child: PhotoCard(
                photo: _photos[index],
              ),
            )
          );
        }
      ),
    );
  }
}
