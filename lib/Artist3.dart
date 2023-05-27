import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/artist.dart';

import 'package:http/http.dart' as http;

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);



  @override
  State<result> createState() => _resultState();


}

class _resultState extends State<result> {
  Future<artist> FetchAlbum() async{

    final resp = await http.get(Uri.parse("http://itunes.apple.com/lookup?id=909253"));
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(resp.body));
      return artist.fromJson(jsonDecode(resp.body)["results"]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<artist>(
      future: FetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.artistName.toString()),
              Text(snapshot.data!.artistType.toString()),
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
