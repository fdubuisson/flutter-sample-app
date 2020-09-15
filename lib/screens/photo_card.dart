import 'package:flutter/material.dart';
import 'package:flutter_app/domain/photo.dart';

class PhotoCard extends StatefulWidget {
  PhotoCard({Key key, this.photo}) : super(key: key);

  final Photo photo;

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${widget.photo.title}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Image.network(
                  '${widget.photo.thumbnailUrl}',
                  fit: BoxFit.cover,
                  width: 1200,
                  //height: 1200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}