import 'dart:convert';
import 'package:http/http.dart';

class Photo {
  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "albumId": int albumId,
        "id": int id,
        "title": String title,
        "thumbnailUrl": String thumbnailUrl,
      } =>
        Photo(
            albumId: albumId, id: id, title: title, thumbnailUrl: thumbnailUrl),
      _ => throw const FormatException("fails to cast")
    };
  }

  final int albumId;
  final int id;
  final String title;
  final String thumbnailUrl;
}

List<Photo> parsePhoto(String response) {
  final parsed = (jsonDecode(response) as List).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhoto(Client client) async {
  final response = await client
      .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  return parsePhoto(response.body);
}
