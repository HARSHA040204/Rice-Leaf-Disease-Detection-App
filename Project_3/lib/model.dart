import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:project_2/abc.dart';
import 'package:project_2/pages/home_page.dart';
import 'package:project_2/weather_page.dart';
import 'package:project_2/ShopPage.dart';
import 'package:project_2/diseases.dart';

void model1() {
  runApp(model());
}

class model extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePickerDemo(),
    );
  }
}

class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  var _recognitions;
  var v = "";

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }


  Future detectimage(File image) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      v = recognitions.toString();
    });
    print("//////////////////////////////////////////////////");
    print(_recognitions);
    print("//////////////////////////////////////////////////");
    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => conversation(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              Text('No image selected'),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _pickImageFromCamera(), // Call the new method _pickImageFromCamera
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B8F56),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              ),
              child: Text(
                'Open Camera', // Update the text accordingly
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B8F56),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                ),
                child: Text(
                  'Open Gallery',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _recognitions != null && _recognitions.isNotEmpty
                    ? _mapLabels(_recognitions[0]['label'])
                    : 'Please Place Your Image',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Classes(),
                  ),
                );
              },
              child: SizedBox(
                width: 330,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF2B8F56),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/Ellipse7.png', width: 30),
                      const Text('Diseases', style: TextStyle(fontSize: 16, color: Colors.white),),
                      Image.asset('assets/back_arrow.png', width: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        color: Color(0xFF2B8F56),
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
                          builder: (context) => WeatherPage(),
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
                          builder: (context) => const homepage(),
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
                        builder: (context) => ShopPage(),
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
      backgroundColor: Colors.lightGreen.shade100,
    );
  }

  String _mapLabels(String label) {
    switch (label) {
      case 'healthy':
        return 'It is ' +'Healthy';
      case 'leaf_blast':
        return 'Disease is: ' +'Leaf Blast';
      case 'bacterial_leaf_blight':
        return 'Disease is: ' +'Bacterial Leaf Blight';
      case 'brown_spot':
        return 'Disease is: ' +'Brown Spot';
      case 'leaf_scald':
        return 'Disease is: ' +'Leaf Scald';
      case 'narrow_brown_spot':
        return 'Disease is: ' +'Narrow Brown Spot';
      case 'not_there':
        return 'Place Proper Image';
      default:
        return 'Place Proper Image';
    }
  }
}
