import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/photo.dart';
import 'package:flutter_app/data_access/photos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Photo _photo = Photo();

  Future<void> nextPhoto() async {
    var photos = await fetchPhotos();
    setState(() {
      _photo = photos[new Random().nextInt(100)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_photo.title}',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Image.network(
              '${_photo.thumbnailUrl}',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nextPhoto,
        tooltip: 'Next',
        child: Icon(Icons.add),
      ),
    );
  }
}
