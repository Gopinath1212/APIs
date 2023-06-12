import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:test123/Inter.dart';
import 'package:test123/List.dart';
import 'package:test123/new.dart';

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  State<Lab> createState() => _LabState();
}

class _LabState extends State<Lab> {



  Future<List<Plans>> fetchPlanData() async{

    final resp = await http.get(Uri.parse("https://stagingv2.trackki.com/app/api/v1/styles/4971d939-c0aa-45f0-b8db-5fd1e0762744/fetch_tna_plan?source=null"));
    if (resp.statusCode == 200||resp.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(resp.body));
      List x = jsonDecode(resp.body)["plans"];
      return x.map((y)=>Plans.fromJson(y)).toList();

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Plans>>(
      future: fetchPlanData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Plans object = snapshot.data![index];
                return InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      title: Text("Plan ${index+1}"),
                  ),
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








