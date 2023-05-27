import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/album.dart';

import 'package:http/http.dart' as http;

class AlbumAPI extends StatefulWidget {
  const AlbumAPI({Key? key}) : super(key: key);

  @override
  State<AlbumAPI> createState() => _AlbumAPIState();
}

class _AlbumAPIState extends State<AlbumAPI> {

  Future<Album> FetchAlbum() async{

    final resp = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(resp.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.id.toString()),
              Text(snapshot.data!.title.toString())
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
