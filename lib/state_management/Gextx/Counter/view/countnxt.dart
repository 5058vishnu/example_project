import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/countercontroller.dart';
import 'countgetx.dart';

class GetCountNxt extends StatefulWidget {
  const GetCountNxt({super.key});

  @override
  State<GetCountNxt> createState() => _GetCountNxtState();
}

class _GetCountNxtState extends State<GetCountNxt> {
  final CounterController _counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd page"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          child: Column(
        children: [
          Obx(() => Text("Counter : ${_counterController.count}")),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _counterController.incCount();
                  },
                  child: const Text("Increment")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _counterController.decCount();
                  },
                  child: const Text("Deccrement")),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Get.off(() => const CounterAppGetX(),
                    transition: Transition.cupertino);
              },
              child: const Text("Back")),
        ],
      )),
    );
  }
}
