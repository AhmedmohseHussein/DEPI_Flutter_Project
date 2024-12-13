import 'package:depi_flutter_project/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _PhotosScreen();
  }
}

class _PhotosScreen extends State<PhotosScreen> {
  late Future<List<Photo>> futurePhoto;

  @override
  void initState() {
    super.initState();
    futurePhoto = fetchPhoto(Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photos Page'),
        ),
        body: FutureBuilder<List<Photo>>(
          future: futurePhoto,
          builder: (context, data) {
            if (data.hasError) {
              return const Center(
                child: Text('error'),
              );
            } else if (data.hasData) {
              return DataView(photosList: data.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class DataView extends StatelessWidget {
  const DataView({super.key, required this.photosList});

  final List<Photo> photosList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: photosList.length ~/ 500,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(15),
            leading: Image.network(
              photosList[index].thumbnailUrl,
              fit: BoxFit.cover,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(photosList[index].title),
                // Text("ID :$photosList[index].id.toString()"),
                //  Text("AlbumID :$photosList[index].albumId.toString()"),
              ],
            ),
          );
        });
  }
}
