import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Deee extends StatefulWidget {
  const Deee({super.key});

  @override
  State<Deee> createState() => _DeeeState();
}

class _DeeeState extends State<Deee> {
  var isLoading = true;

  var image = [];

  void initState() {
    // TODO: implement initState
    readShoes();
    super.initState();
  }

  readShoes() async {
    var url = "https://example-project-c8377-default-rtdb.firebaseio.com/" +
        "records.json";

    final result = await http.get(Uri.parse(url));

    final data = json.decode(result.body) as Map<String, dynamic>;

    data.forEach((key, value) {
      image.add(value["photo"]);
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
      :ListView.builder(

        itemBuilder: (context, index) {
          return SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(child: Image(image: NetworkImage(image[index])),)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
