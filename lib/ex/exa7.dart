import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Classi extends StatefulWidget {
  const Classi({super.key});

  @override
  State<Classi> createState() => _ClassiState();
}

class _ClassiState extends State<Classi> {
  @override
  void initState() {
    getcode();
    // TODO: implement initState
    super.initState();
  }
  var name=[];




  getcode() async {
    var url='https://example-project-c8377-default-rtdb.firebaseio.com/Record.json';
    final result=await http.get(
        Uri.parse(url)
    );

    final data= json.decode(result.body) as Map<String, dynamic>;

    data.forEach((key, value) {
      name.add(value["name"]);


    });



  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: ListView.builder(itemCount: name.length,itemBuilder: (context, index) {
      return Card(
        color: Colors.lightBlue[50],
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(10)),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/image.jpeg',

                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Text("${name[index]}"),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded,
                          color: Colors.white70),
                      Text(
                        '2014',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.speed_rounded,
                          color: Color.fromARGB(1768, 255, 204, 0)),
                      Text(
                        '59000 KM',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.info_outline_rounded,
                          color: Colors.teal),
                      Text(
                        'Diesel',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      Text(
                        '71,00,000',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),

                ],
              ),
            )
            // Other car details here
          ],
        ),
      );
    },),);
  }
}
