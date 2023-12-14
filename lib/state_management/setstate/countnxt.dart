import 'package:flutter/material.dart';

class CountNxt extends StatefulWidget {
  int? incVal;

  CountNxt({Key? key, required this.incVal}) : super(key: key);

  @override
  State<CountNxt> createState() => _CountNxtState();
}

class _CountNxtState extends State<CountNxt> {
  void incCount() {
    setState(() {
      widget.incVal = widget.incVal! + 1;
    });
  }

  void decCount() {
    setState(() {
      widget.incVal = widget.incVal! - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2nd page"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Counter : ${widget.incVal}"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      incCount();
                    },
                    child: const Text("Increment")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      decCount();
                    },
                    child: const Text("Deccrement")),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
