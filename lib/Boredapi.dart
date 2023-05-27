import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/Bored.dart';

import 'package:http/http.dart' as http ;

class BoredAPI extends StatefulWidget {
  const BoredAPI({Key? key}) : super(key: key);

  @override
  State<BoredAPI> createState() => _BoredAPIState();
}

class _BoredAPIState extends State<BoredAPI> {
  Future<Bored> FetchAlbum() async{

    final resp = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Bored.fromJson(jsonDecode(resp.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Bored>(
      future: FetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.activity.toString()),
              Text(snapshot.data!.type.toString()),
              Text(snapshot.data!.participants.toString()),
              Text(snapshot.data!.price.toString()),
              Text(snapshot.data!.link.toString()),
              Text(snapshot.data!.key.toString()),
              Text(snapshot.data!.accessibility.toString()),
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
