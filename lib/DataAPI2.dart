import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/Data.dart';

import 'package:http/http.dart' as http;

class MSD extends StatefulWidget {
  const MSD({Key? key}) : super(key: key);

  @override
  State<MSD> createState() => _MSDState();
}

class _MSDState extends State<MSD> {
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
              itemCount:_lis.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Container(
                      color: Colors.brown,
                      height: 200,
                      width: 180,
                      child: Row(
                        children: [
                          Image.network(snapshot.data![index].avatar.toString()),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data![index].first_name.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(snapshot.data![index].last_name.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(snapshot.data![index].id.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapshot.data![index].email.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          )
                        ],
                      ),
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

class Slider
{
  String? image;

  Slider(this.image);
}
List _lis = SliderData.map((e) => Slider(e["image"], )).toList();

var SliderData = [

  {"image":"https://reqres.in/img/faces/8-image.jpg"},
  {"image":"https://reqres.in/img/faces/9-image.jpg"},
  {"image":"https://reqres.in/img/faces/10-image.jpg"},
  {"image":"https://reqres.in/img/faces/11-image.jpg"},
];