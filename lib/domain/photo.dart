
class Photo {
  final int albumId;
  final int id;
  final String thumbnailUrl;
  final String title;
  final String url;

  Photo({this.albumId, this.id, this.thumbnailUrl, this.title, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['userId'],
      id: json['id'],
      thumbnailUrl: json['thumbnailUrl'],
      title: json['title'],
      url: json['url'],
    );
  }
}
