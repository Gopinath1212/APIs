import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';

import 'Models/artist.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var jsonList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchAlbum();
  }
  void FetchAlbum() async {
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    var response = await dio
        .get('http://itunes.apple.com/lookup?id=909253');
    if (response.statusCode == 200) {
      setState(() {
        jsonList = response.data['results'] as List;
        print(jsonList);
      });
    } else {
      print(response.statusCode);
    }

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artist",style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
        body:ListView.builder(
            itemCount: jsonList == null ? 0 : jsonList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Text(jsonList[index]['artistName'])
              );
            })
    );
  }
}
