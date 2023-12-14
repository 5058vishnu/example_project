// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart'as stt;
// import 'package:speech_to_text/speech_to_text.dart';
// class SpeechExample extends StatefulWidget {
//   const SpeechExample({super.key});
//
//   @override
//   State<SpeechExample> createState() => _SpeechExampleState();
// }
//
// class _SpeechExampleState extends State<SpeechExample> {
//   stt.SpeechToText _speechToText = stt.SpeechToText();
//   String _text = 'Press the button and start speaking...';
//
//   void _listen() async {
//     if (await _speechToText.initialize()) {
//       _speechToText.listen(
//         onResult: (result) {
//           setState(() {
//             _text = result.recognizedWords;
//           });
//         },
//       );
//     } else {
//       print('Speech recognition not available');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_text),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _listen();
//               },
//               child: Text('Start Listening'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
