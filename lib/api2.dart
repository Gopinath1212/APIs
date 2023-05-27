import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/album2.dart';

import 'package:http/http.dart' as http ;

class Model extends StatefulWidget {
  const Model({Key? key}) : super(key: key);

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  Future<Album2> FetchAlbum() async{

    final resp = await http.get(Uri.parse("https://catfact.ninja/fact"));
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album2.fromJson(jsonDecode(resp.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {

     return FutureBuilder<Album2>(
      future: FetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.fact.toString()),
              Text(snapshot.data!.length.toString()),
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
