import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Models/Raw.dart';

import 'package:http/http.dart' as http;

class Rawapi extends StatefulWidget {
  const Rawapi({Key? key}) : super(key: key);

  @override
  State<Rawapi> createState() => _RawapiState();
}

class _RawapiState extends State<Rawapi> {
  var jsonList;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchAlbum();
  }
 void FetchAlbum() async {

    var response = await Dio()
        .get('http://rawgymtest.gtgym.in/transactionmode/gettransactionmode');
    if (response.statusCode == 200) {
      setState(() {
        jsonList = response.data['transactionModeList'] as List;
        print(jsonList.length);
      });
    } else {
      print(response.statusCode);
    }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GeeksForGeeks',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:
       ListView.builder(
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Text(jsonList[index]['transactionModeName'])
            );
          }));
    }

  }

