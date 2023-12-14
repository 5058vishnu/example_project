import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var names = [];

  readProduct() async {
    var url =
        "https://example-project-c8377-default-rtdb.firebaseio.com/carDetails.json";

    final result = await http.get(Uri.parse(url));

    final data = result.body as Map<String, dynamic>;

    data.forEach((key, value) {
      names.add(value["name"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: names.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Column(
              children: [Text(names[index])],
            ),
          );
        },
      ),
    );
  }
}
