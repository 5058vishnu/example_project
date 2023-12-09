import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  var table = Uri.parse("https://example-project-c8377-default-rtdb.firebaseio.com/StudentRecord.json");
  var names = [];
  var ages = [];
  var isLoading = true;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    try {
      final response = await http.get(table);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        names.add(blogData["name"]);
        ages.add(blogData["age"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            height: 100,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Text(names[index]),
                  Text(ages[index].toString())
                  //Text(ages[index].toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
