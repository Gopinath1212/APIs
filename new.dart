import 'package:flutter/material.dart';

import 'List.dart';

class Test extends StatefulWidget {

  const Test({Key? key, required this.list}) : super(key: key);
 final List<Department> list;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {


  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
     body: ListView.builder(
        itemCount: snapshot.data!.list,
        itemBuilder: (BuildContext context, int index) {
          Card(
            child: Container(
              height: 500,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: [
                  Text("Name",style: TextStyle(fontSize: 20),),
                  Text("Status",style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          );
        }
     ),
    );
  }
}
