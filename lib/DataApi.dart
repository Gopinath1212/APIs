import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/Data.dart';

import 'package:http/http.dart' as http;

class New_API extends StatefulWidget {
  const New_API({Key? key}) : super(key: key);

  @override
  State<New_API> createState() => _New_APIState();
}

class _New_APIState extends State<New_API> {
  Future<Data> FetchAlbum() async{

    final resp = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(resp.body));
      return Data.fromJson(jsonDecode(resp.body)["data"]);

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future<List<Data>> FetchUserData() async{

    final resp = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(resp.body));
      List x = jsonDecode(resp.body)["data"];
      return x.map((y)=>Data.fromJson(y)).toList();
      //return Data.fromJson(jsonDecode(resp.body)["data"]);

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Data>>(
      future: FetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Column(
                      children: [
                        Text(snapshot.data![index]!.last_name.toString()),
                        Text(snapshot.data![index]!.first_name.toString()),
                      ],
                    )
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },

    );
  }
}
