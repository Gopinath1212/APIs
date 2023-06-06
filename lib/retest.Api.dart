// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:halo/Models/Hidoc.dart';
// import 'package:halo/Models/retest.dart';

import 'package:http/http.dart'as http;

class Bullet extends StatefulWidget {
  const Bullet({Key? key}) : super(key: key);

  @override
  State<Bullet> createState() => _BulletState();
}

class _BulletState extends State<Bullet> {
  late List<TrandingBulletin> listTrend = [];


  Future<List<TrandingBulletin>> FetchUserData() async{
    var map = new Map<String, dynamic>();
    map['sId'] = '500';
    map['uuId'] = '';
    map['userId'] = '423914';
     List<TrandingBulletin > list = [];
    // List<TrandingBulletin>? trandingArticle;

    var resp = await http.post(
      Uri.parse('http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: map,
    );
    // final resp = await http.post(Uri.parse("http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?sId=500&uuId&userId=423914"));

    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body)["data"];
      listTrend = Data.fromJson(data).trandingBulletin!;
      print(listTrend);
      return listTrend;


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
      body:
      FutureBuilder<List<TrandingBulletin>>(
        future: FetchUserData(),
        builder: (context, snapshot) {

          // WHILE THE CALL IS BEING MADE AKA LOADING
          if (ConnectionState.active != null && !snapshot.hasData) {
            return Center(child: Text('Loading..'));
          }

          // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
          if (ConnectionState.done != null && snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          // IF IT WORKS IT GOES HERE!
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(snapshot.data![index].id.toString()),
                  Text(snapshot.data![index].articleTitle.toString()),
                  Text(snapshot.data![index].redirectLink.toString()),
                  Image.network(snapshot.data![index].articleImg.toString()),
                  Text(snapshot.data![index].articleDescription.toString()),
                  Text(snapshot.data![index].specialityId.toString()),
                  Text(snapshot.data![index].rewardPoints.toString()),

                ],
              );
            },
          );
        },

      ),
    );
  }
}
