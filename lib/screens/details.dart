import 'package:flutter/material.dart';
import 'package:flutter_app/domain/photo.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.photo}) : super(key: key);

  final Photo photo;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Image.network(
        '${widget.photo.url}',
        fit: BoxFit.cover,
      );
  }
}
