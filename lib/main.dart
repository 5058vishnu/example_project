import 'package:example_project/ex/viewProduct.dart';
import 'package:example_project/state_management/Gextx/Login/view/loginhome.dart';
import 'package:example_project/state_management/setstate/counterapp.dart';
import 'package:example_project/text_to_speak.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ex/exa1.dart';
import 'ex/exa2.dart';
import 'ex/exa3.dart';
import 'ex/exa4.dart';
import 'ex/exa6.dart';
import 'ex/exa7.dart';
import 'ex/speech_to_text.dart';
import 'exa5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home:LoginHome()
    );
  }
}

