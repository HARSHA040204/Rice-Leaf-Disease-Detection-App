//
// import 'package:flutter/material.dart';
// import 'package:project_2/DashBoardScreen.dart';
// import 'package:project_2/ShopPage.dart';
// import 'package:project_2/diseases.dart';
// import 'package:project_2/pages/home_page.dart';
// import 'package:project_2/weather_page.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class conversation extends StatelessWidget {
//   const conversation({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2B8F56),
//         centerTitle: true,
//         elevation: 0,
//         shape: const RoundedRectangleBorder(),
//         title: const Text(
//           "AGRI GUARDIAN",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: "poppins",
//             fontWeight: FontWeight.w800,
//             fontSize: 18,
//             color: Colors.white,
//             letterSpacing: 5,
//             height: 1.0,
//             shadows: [
//               Shadow(
//                 blurRadius: 6.0,
//                 color: Color.fromARGB(124, 23, 23, 23),
//                 offset: Offset(2, 2),
//               ),
//             ],
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.lightGreen.shade100,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         children: [
//                           buildStep('assets/Ellipse4.png', 'Select Affected Crop', 'Step 1:'),
//                           const SizedBox(height: 40),
//                           buildStep('assets/Ellipse5.png', 'Upload/Scan Crop\'s photo', 'Step 2:'),
//                           const SizedBox(height: 40),
//                           buildStep('assets/Ellipse6.png', 'Get Solution to Problem', 'Step 3:'),
//                           const SizedBox(height: 40),
//                           ElevatedButton(
//                             onPressed: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     backgroundColor: Colors.lightGreen.shade100, // Background color of the dialog box
//                                     title: Center(child: const Text("Choose Option", style: TextStyle(color: Colors.black))), // Title text color
//                                     content: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         ElevatedButton(
//                                           onPressed: () async {
//                                             final ImagePicker _picker = ImagePicker();
//                                             final XFile? image = await _picker.pickImage(source: ImageSource.camera); // Open camera
//                                             // Use the image captured from the camera
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.green, // Button color
//                                           ),
//                                           child: const Text("Open Camera", style: TextStyle(color: Colors.white)), // Button text color
//                                         ),
//                                         ElevatedButton(
//                                           onPressed: () async {
//                                             final ImagePicker _picker = ImagePicker();
//                                             final XFile? image = await _picker.pickImage(source: ImageSource.gallery); // Open gallery
//                                             // Use the image selected from the gallery
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.blue, // Button color
//                                           ),
//                                           child: const Text("Open Gallery", style: TextStyle(color: Colors.white)), // Button text color
//                                         ),
//
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: const Size(270, 50),
//                               backgroundColor: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             child: const Text("Start", style: TextStyle(fontSize: 20, color: Colors.white)),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 50),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                               builder: (context) => Classes()
//                           ),
//                         );
//                         // Navigate to Diseases page
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.lightGreen.shade100,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.asset('assets/Ellipse7.png', width: 40),
//                             const Text('Diseases',style: TextStyle(fontSize: 20),),
//                             Image.asset('assets/back_arrow.png', width: 30),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 4,
//         color: Color(0xF22B8F56),
//         height: 88,
//         child: SizedBox(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Expanded(
//                 child: Container(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => WeatherPage(), // Navigate to WeatherPage
//                         ),
//                       );
//                     },
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.wb_cloudy_outlined, color: Colors.white,size: 27),
//                         Text("Weather", style: TextStyle(color: Color(
//                             0xE6FAFAFA))),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const homepage(), // Navigate to home_page.dart
//                         ),
//                       );
//                     },
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.person, color: Colors.white,size: 27),
//                         Text("Profile", style: TextStyle(color: Colors.white)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => ShopPage(), // Navigate to home_page.dart
//                       ),
//                     );
//                   },
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.shopping_cart, color: Colors.white, size: 27),
//                       Text("Cart", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildStep(String imagePath, String text, String stepText) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           stepText,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(imagePath, width: 50),
//                 const SizedBox(height: 10),
//                 Text(text, style: TextStyle(fontSize: 16),),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import 'package:project_2/ShopPage.dart';
import 'package:project_2/diseases.dart';
import 'package:project_2/model.dart';
import 'package:project_2/pages/home_page.dart';
import 'package:project_2/weather_page.dart';
import 'package:image_picker/image_picker.dart';
import 'HomeScreen.dart'; // Import the HomeScreen widget from Project 1

class conversation extends StatelessWidget {
  const conversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFF2B8F56),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        title: const Text(
          "AGRI GUARDIAN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "poppins",
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 5,
            height: 1.0,
            shadows: [
              Shadow(
                blurRadius: 6.0,
                color: Color.fromARGB(124, 23, 23, 23),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2B8F56)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          buildStep('assets/Ellipse4.png', 'Select Affected Crop', 'Step 1:'),
                          const SizedBox(height: 40),
                          buildStep('assets/Ellipse5.png', 'Upload Crop\'s photo', 'Step 2:'),
                          const SizedBox(height: 40),
                          buildStep('assets/Ellipse6.png', 'Get Solution to Problem', 'Step 3:'),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => model(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(270, 50),
                              backgroundColor:Color(0xFF2B8F56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Start", style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Classes(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/Ellipse7.png', width: 40),
                            const Text('Diseases',style: TextStyle(fontSize: 20),),
                            Image.asset('assets/back_arrow.png', width: 30),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        color: Color(0xF22B8F56),
        height: 88,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WeatherPage(), // Navigate to WeatherPage
                        ),
                      );
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wb_cloudy_outlined, color: Colors.white,size: 27),
                        Text("Weather", style: TextStyle(color: Color(
                            0xE6FAFAFA))),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const homepage(), // Navigate to home_page.dart
                        ),
                      );
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.white,size: 27),
                        Text("Profile", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShopPage(), // Navigate to home_page.dart
                      ),
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white, size: 27),
                      Text("Cart", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStep(String imagePath, String text, String stepText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          stepText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 50),
                const SizedBox(height: 10),
                Text(text, style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
