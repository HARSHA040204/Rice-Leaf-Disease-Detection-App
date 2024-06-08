// import 'package:flutter/material.dart';
//
// class UnbordingContent {
//   String title;
//   String discription;
//   Color backgroundColor;
//   UnbordingContent({
//     required this.title,
//     required this.discription,
//     required this.backgroundColor,
//   });
// }
//
// // Created By Flutter Baba
// List<UnbordingContent> contentsList = [
//   UnbordingContent(
//     backgroundColor: const Color(0xFF0C7305),
//     title: "Welcome to AGRI GUARDIAN",
//     discription: "Protectors of FARMERS",
//   ),
//   UnbordingContent(
//     backgroundColor: const Color(0xFF0C7305),
//     title: '',
//     discription:
//         "A vigilant friend that's always here to keep things in check.",
//   ),
//   UnbordingContent(
//     backgroundColor: const Color(0xFF0C7305),
//     title: '',
//     discription:
//         "Hate has no place here - our chatbot is on the case, keeping conversations safe and hate-free!",
//   ),
// ];

import 'package:flutter/material.dart';

class UnbordingContent {
  String title;
  String discription;

  UnbordingContent({
    required this.title,
    required this.discription,
  });
}

// Created By Flutter Baba
List<UnbordingContent> contentsList = [
  UnbordingContent(
    title: "   Welcome To"
        "\nAGRI GUARDIAN",

    discription: "Protecting crops,"
        "\nEmpowering Farmers.",

  ),
  UnbordingContent(
    title: '',
    discription: "Disease Detection in single Click",
  ),
  UnbordingContent(
    title: '',
    discription: "Detailed reports of diagnosis and treatment",
  ),
];
