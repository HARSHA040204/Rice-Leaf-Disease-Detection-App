// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
//
//
// import '../bot.dart';
//
// class RecognizePage extends StatefulWidget {
//   final String? path;
//
//   const RecognizePage({Key? key, this.path}) : super(key: key);
//
//   @override
//   State<RecognizePage> createState() => _RecognizePageState();
// }
//
// class _RecognizePageState extends State<RecognizePage> {
//   bool _isBusy = false;
//   TextEditingController controller = TextEditingController();
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     final InputImage inputImage = InputImage.fromFilePath(widget.path!);
//
//     processImage(inputImage);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(backgroundColor: const Color(0xFF04B4AE),title: const Text("recognized page"),),
//         body: _isBusy == true
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Container(
//                 padding: const EdgeInsets.all(20),
//                 child: TextFormField(
//                   maxLines: MediaQuery.of(context).size.height.toInt(),
//                   controller: controller,
//                   decoration:
//                       const InputDecoration(hintText: "Text goes here..."),
//                 ),
//               ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text("Confirm"),
//                   content: const Text("Are you sure you want to send this data?"),
//                   actions: <Widget>[
//                     TextButton(
//                       child: const Text("CANCEL"),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     TextButton(
//                       child: const Text("SEND"),
//                       onPressed: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (BuildContext context) => bot(
//                               data: controller.text,
//                             ),
//                           ),
//                         );
//                         // Homee chat = Homee(data: controller.text);
//                         // Navigator.push(
//                         // context,
//                         // MaterialPageRoute(builder: (context) => chat),
//                       // );
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//           child: const Icon(Icons.send),
//         ));
//   }
//
//   void processImage(InputImage image) async {
//     final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
//
//     setState(() {
//       _isBusy = true;
//     });
//
//     log(image.filePath!);
//     final RecognizedText recognizedText =
//         await textRecognizer.processImage(image);
//
//     controller.text = recognizedText.text;
//
//
//     ///End busy state
//     setState(() {
//       _isBusy = false;
//     });
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   final String data;
//   const SecondPage({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Second Page"),
//       ),
//       body: Center(
//         child: Text(data),
//       ),
//     );
//   }
// }
//
//
// // import 'dart:developer';
//
// // import 'package:flutter/material.dart';
// // import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
//
// // class RecognizePage extends StatefulWidget {
// //   final String? path;
// //   const RecognizePage({Key? key, this.path}) : super(key: key);
//
// //   @override
// //   State<RecognizePage> createState() => _RecognizePageState();
// // }
//
// // class _RecognizePageState extends State<RecognizePage> {
// //   bool _isBusy = false;
// //   TextEditingController controller = TextEditingController();
//
// //   @override
// //   void initState() {
// //     super.initState();
//
// //     final InputImage inputImage = InputImage.fromFilePath(widget.path!);
//
// //     processImage(inputImage);
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(backgroundColor: const Color(0xFF04B4AE),title: const Text("recognized page"),),
// //         body: _isBusy == true
// //             ? const Center(
// //                 child: CircularProgressIndicator(),
// //               )
// //             : Container(
// //                 padding: const EdgeInsets.all(20),
// //                 child: TextFormField(
// //                   maxLines: MediaQuery.of(context).size.height.toInt(),
// //                   controller: controller,
// //                   decoration:
// //                       const InputDecoration(hintText: "Text goes here..."),
// //                 ),
// //               ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //             showDialog(
// //               context: context,
// //               builder: (BuildContext context) {
// //                 return AlertDialog(
// //                   title: const Text("Confirm"),
// //                   content: const Text("Are you sure you want to send this data?"),
// //                   actions: <Widget>[
// //                     TextButton(
// //                       child: const Text("CANCEL"),
// //                       onPressed: () => Navigator.pop(context),
// //                     ),
// //                     TextButton(
// //                       child: const Text("SEND"),
// //                       onPressed: () {
// //                         Navigator.pushNamed(context, '/chat', arguments: {'data': controller.text});
// //                       },
// //                     ),
// //                   ],
// //                 );
// //               },
// //             );
// //           },
// //           child: const Icon(Icons.send),
// //         ));
// //   }
//
// //   void processImage(InputImage image) async {
// //     final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
//
// //     setState(() {
// //       _isBusy = true;
// //     });
//
// //     log(image.filePath!);
// //     final RecognizedText recognizedText =
// //         await textRecognizer.processImage(image);
//
// //     controller.text = recognizedText.text;
//
// //     ///End busy state
// //     setState(() {
// //       _isBusy = false;
// //     });
// //   }
// // }
//
