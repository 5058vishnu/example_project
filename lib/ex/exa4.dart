
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadShoes extends StatefulWidget {
  const ReadShoes({super.key});

  @override
  State<ReadShoes> createState() => _ReadShoesState();
}

class _ReadShoesState extends State<ReadShoes> {
  var isLoading = true;

  var name=[];
  // var age=[];
  // var image=[];

  @override
  void initState() {
    // TODO: implement initState
    readShoes();
    super.initState();
  }

  readShoes() async {
    var url="https://example-project-c8377-default-rtdb.firebaseio.com/Record/"+"Record.json";

    final result=await http.get(
        Uri.parse(url)
    );

    final data= json.decode(result.body) as Map<String, dynamic>;

    data.forEach((key, value) {
      name.add(value["name"]);
      // age.add(value["age"]);
      // image.add(value['image']);

    });

    setState(() {
      isLoading=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(

          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Text("${name[index]}"),
                    // Text("age ${age[index].toString()}"),
                    // Image(image: NetworkImage(image[index].toString()))

                  ],
                ),
              ),
            );
          },
         ),
    );
  }
}