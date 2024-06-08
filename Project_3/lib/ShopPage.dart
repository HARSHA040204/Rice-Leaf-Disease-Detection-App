import 'package:flutter/material.dart';
import 'package:project_2/pages/home_page.dart';
import 'package:project_2/weather_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'FertilizersViewAllPage.dart';
import 'SeedsViewAllPage.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF2B8F56),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
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
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0), // Adjust top and bottom padding
              child: Row(
                children: [
                  // const SizedBox(width: 10), // Add padding to the left of the icon
                  const Icon(Icons.ac_unit), // Add icon to the left of "Fertilizer"
                  const SizedBox(width: 8), // Add spacing between icon and text
                  const Text(
                    "Fertilizer",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(), // Add spacer to push "View All" button to the right
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FertilizersViewAllPage()),
                      );
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            _buildProductSection(context, fertilizerProducts),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0), // Adjust top and bottom padding
              child: Row(
                children: [
                  const Icon(Icons.local_florist),
                  const SizedBox(width: 8),
                  const Text(
                    "Seeds",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(), // Add spacer to push "View All" button to the right
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SeedsViewAllPage()),
                      );
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            _buildProductSection(context, seedsProducts),
          ],
        ),
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

  Widget _buildProductSection(BuildContext context, List<Product> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.1 / 3, // Adjust as needed
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Stack(
                              children: [
                                InteractiveViewer(
                                  child: Image.asset(
                                    product.imageLink,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(Icons.close, color: Colors.black,),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: -2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              product.imageLink,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Price: \u20B9${product.price}", style: const TextStyle(fontSize: 14)),
                      Text("Quantity: ${product.quantity} kg/L", style: const TextStyle(fontSize: 14)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, // Align to the right side
                          children: [
                            TextButton(
                              onPressed: () {
                                // Launch product view link when button is pressed
                                _launchurl(product.viewLink);
                              },
                              child: const Text(
                                'View',
                                style: TextStyle(color: Colors.purple), // Set text color to purple
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

// Function to launch the URL
// void _launchurl(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
void _launchurl(String url) async {
  await FlutterWebBrowser.openWebPage(url: url);
}

class Product {
  final String name;
  final String imageLink;
  final double price;
  final double quantity;
  final String viewLink;

  Product({
    required this.name,
    required this.imageLink,
    required this.price,
    required this.quantity,
    required this.viewLink,
  });
}

// Define fertilizer products
final List<Product> fertilizerProducts = [
  Product(
    name: "Blitox",
    imageLink: "assets/images/Blitox.jpg",
    price: 560,
    quantity: 0.5,
    viewLink: "https://amzn.in/d/feS8uKF",
  ),
  Product(
    name: "Fungus Remover",
    imageLink: "assets/images/Fungicide.jpg",
    price: 265,
    quantity: 0.5,
    viewLink: "https://amzn.in/d/fcMq5YK",
  ),
];

// Define seeds products
final List<Product> seedsProducts = [
  Product(
    name: "Pusa Basmati",
    imageLink: "assets/images/Pusa Basmati.jpg",
    price: 799,
    quantity: 2,
    viewLink: "https://amzn.in/d/gUMyBas",
  ),
  Product(
    name: "Dubraj Rice Paddy",
    imageLink: "assets/images/Dubraj.jpg",
    price: 899,
    quantity: 2,
    viewLink: "https://amzn.in/d/a3zkTwc",
  ),
];

