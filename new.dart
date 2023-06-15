import 'package:flutter/material.dart';

import 'List.dart';

class Test extends StatefulWidget {

  const Test({Key? key, required this.list}) : super(key: key);
 final List<Department> list;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {


  List<Department> list=[];


  @override
  void initState() {
    list = widget.list;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
     body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
         return Card(
            child: Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: [
                  Text(list[index].name!,style: TextStyle(fontSize: 20),),
                  Text(list[index].status!,style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          );
        }
     ),
    );
  }
}
