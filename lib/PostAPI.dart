import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();

  Future<bool> PostTransaction() async {
    var response = await http.post(
      Uri.parse('http://rawgymtest.gtgym.in/transactionmode/inserttransactionmode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{

          "transactionModeId":txt1.text,
          "transactionModeName":txt2.text,
          "createdBy":txt3.text

      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: txt1,
            decoration: const InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                prefixIcon: Icon(Icons.lock),
                labelText:"Transaction Mode Id",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue
                    )
                )

            ),

          ), TextFormField(
            controller: txt2,
            decoration: const InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                prefixIcon: Icon(Icons.lock),
                labelText:"Name",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue
                    )
                )

            ),

          ),
          TextFormField(
            controller: txt3,
            decoration: const InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                prefixIcon: Icon(Icons.lock),
                labelText:"created by",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue
                    )
                )

            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if(await PostTransaction())
                {
print("success");
                }
              else
                {
                  print("Failed");
                }
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
