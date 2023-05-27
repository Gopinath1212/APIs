import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:http/http.dart'as http;

class Emplyee extends StatefulWidget {
  const Emplyee({Key? key}) : super(key: key);

  @override
  State<Emplyee> createState() => _EmplyeeState();
}

class _EmplyeeState extends State<Emplyee> {
  var jsonList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchAlbum();
  }
  void FetchAlbum() async {

    var response = await Dio()
        .get('http://catodotest.elevadosoftwares.com/Employee/GetAllEmployeeDetails');
    if (response.statusCode == 200) {
      setState(() {
        jsonList = response.data['employeeList'] as List;
        print(jsonList);
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
            'employee',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body:
        ListView.builder(
            itemCount: jsonList == null ? 0 : jsonList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Text(jsonList[index]['employeeName'])
              );
            }));
  }
}
