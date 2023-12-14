// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// class SpeakExample extends StatefulWidget {
//   const SpeakExample({super.key});
//
//   @override
//   State<SpeakExample> createState() => _SpeakExampleState();
// }
//
// class _SpeakExampleState extends State<SpeakExample> {
//   var speakcontroller=TextEditingController();
//   FlutterTts Tts=FlutterTts();
//   Future _speak(String text) async {
//     await Tts.setLanguage('ar-tn');
//     await Tts.setPitch(4);
//     await Tts.speak(text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             TextField(
//               controller: speakcontroller,
//
//             ),
//             ElevatedButton(onPressed: () {
// setState(() {
//   _speak(speakcontroller.text);
// });
//             }, child: Text("speak"))
//           ],
//         ),
//       ),
//     );
//   }
// }
