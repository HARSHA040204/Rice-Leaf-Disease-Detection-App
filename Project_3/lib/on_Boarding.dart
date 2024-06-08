//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project_2/Data.dart/Data.dart';
// import 'package:project_2/welcome.dart';
// import 'auth/main_page.dart';
//
// class Onboarding extends StatefulWidget {
//   const Onboarding({super.key});
//
//   @override
//   State<Onboarding> createState() => _OnboardingState();
// }
//
// class _OnboardingState extends State<Onboarding> {
//   PageController? _controller;
//   int currentIndex = 0;
//   double percentage = 0.3333;
//
//   @override
//   void initState() {
//     _controller = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(currentIndex == 0 ? "assets/bg1.png" : "assets/bg.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Content
//           SafeArea(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: PageView.builder(
//                     controller: _controller,
//                     itemCount: contentsList.length,
//                     onPageChanged: (int index) {
//                       if (index >= currentIndex) {
//                         setState(() {
//                           currentIndex = index;
//                           percentage += 0.3333;
//                         });
//                       } else {
//                         setState(() {
//                           currentIndex = index;
//                           percentage -= 0.3333;
//                         });
//                       }
//                     },
//                     itemBuilder: (context, index) {
//                       String? imagePath;
//                       double? borderRadius;
//                       switch (index) {
//                         case 1:
//                           imagePath = 'assets/2.png';
//                           borderRadius = 20.0;
//                           break;
//                         case 2:
//                           imagePath = 'assets/3.png';
//                           borderRadius = 15.0;
//                           break;
//                         default:
//                           imagePath = null;
//                           borderRadius = null;
//                       }
//
//                       return Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               if (imagePath != null)
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(borderRadius ?? 0),
//                                   child: Image.asset(
//                                     imagePath,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               SizedBox(height: 20),
//                               Center(
//                                 child: Text(
//                                   contentsList[index].title,
//                                   style: const TextStyle(
//                                     fontFamily: "SF-Pro",
//                                     fontStyle: FontStyle.normal,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 28.0,
//                                     letterSpacing: 0.24,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height:20),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                                 child: Text(
//                                   contentsList[index].discription,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                     fontFamily: "SF-Pro",
//                                     fontStyle: FontStyle.normal,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 25.0,
//                                     color: Colors.white70,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CupertinoButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => const MainPage()));
//                         },
//                         child: const Text(
//                           "Skip",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: List.generate(
//                           contentsList.length,
//                               (index) => buildDot(index, context),
//                         ),
//                       ),
//                       CupertinoButton(
//                         onPressed: () {
//                           if (currentIndex == contentsList.length - 1) {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => const MainPage()));
//                           }
//                           _controller!.nextPage(
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                           );
//                         },
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             SizedBox(
//                               height: 60,
//                               width: 60,
//                               child: CircularProgressIndicator(
//                                 value: percentage,
//                                 backgroundColor: Colors.white38,
//                                 valueColor: const AlwaysStoppedAnimation<Color>(
//                                   Colors.green,
//                                 ),
//                               ),
//                             ),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               child: Icon(
//                                 Icons.arrow_forward_ios_outlined,
//                                 color: Colors.green,
//                                 size: 30,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   AnimatedContainer buildDot(int index, BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//       height: 8,
//       width: currentIndex == index ? 24 : 8,
//       margin: const EdgeInsets.only(right: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(18),
//         color: currentIndex == index ? Colors.green : Colors.white38,
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2/Data.dart/Data.dart';
import 'auth/main_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController? _controller;
  int currentIndex = 0;
  double percentage = 0.3333;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentIndex == 0 ? "assets/bg1.png" : "assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: contentsList.length,
                    onPageChanged: (int index) {
                      if (index >= currentIndex) {
                        setState(() {
                          currentIndex = index;
                          percentage += 0.3333;
                        });
                      } else {
                        setState(() {
                          currentIndex = index;
                          percentage -= 0.3333;
                        });
                      }
                    },
                    itemBuilder: (context, index) {
                      String? imagePath;
                      double? borderRadius;
                      switch (index) {
                        case 1:
                          imagePath = 'assets/2.png';
                          borderRadius = 20.0;
                          break;
                        case 2:
                          imagePath = 'assets/3.png';
                          borderRadius = 15.0;
                          break;
                        default:
                          imagePath = null;
                          borderRadius = null;
                      }

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (index == 0)
                                SizedBox(height: 380), // Add a SizedBox for the first page
                              if (imagePath != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              SizedBox(height: 25),
                              Center(
                                child: Text(
                                  contentsList[index].title,
                                  style: const TextStyle(
                                    fontFamily: "SF-Pro",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32.0,
                                    letterSpacing: 0.24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height:20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                child: Text(
                                  contentsList[index].discription,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: "SF-Pro",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.0,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MainPage()));
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: List.generate(
                          contentsList.length,
                              (index) => buildDot(index, context),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          if (currentIndex == contentsList.length - 1) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MainPage()));
                          }
                          _controller!.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(
                                value: percentage,
                                backgroundColor: Colors.white38,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.green,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 8,
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: currentIndex == index ? Colors.green : Colors.white38,
      ),
    );
  }
}
