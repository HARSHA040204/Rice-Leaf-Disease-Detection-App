


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:project_2/pages/home_page.dart';
import 'ShopPage.dart';
import 'weather_api_service.dart';
import 'weather_model.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherApiService apiService = WeatherApiService();
  String selectedCity = '';
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    _getLocationAndFetchWeather();
  }

  _getLocationAndFetchWeather() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String cityName = placemarks[0].locality ?? 'DefaultCityName';

    setState(() {
      selectedCity = cityName;
      futureWeather = apiService.fetchWeather(selectedCity);
    });
  }

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
                color: Color(0xFF1A1A1A),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on, color: Colors.white),
            onPressed: () {
              _showCitySelectionDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/weather.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder<Weather>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final weather = snapshot.data!;
                var forecast = weather.forecast;
                var isDayTime = _isDayTime(weather);

                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                        decoration: BoxDecoration(
                          color: Color(0xFF4F8677)?.withOpacity(1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFB1CFCD)),
                        ),
                        child: Text('Location: $selectedCity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(
                            0xE6FCFCFC))),
                      ),
                      SizedBox(height: 24),
                      _wrapWithOpacity(_buildCurrentWeather(weather, isDayTime)),
                      SizedBox(height: 20),
                      _wrapWithOpacity(_buildForecastBox(forecast, 1)),
                      SizedBox(height: 20),
                      _wrapWithOpacity(_buildInfoRow(weather)),
                    ],
                  ),
                );
              }
            },
          ),
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

  Widget _wrapWithOpacity(Widget widget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Set background color to transparent
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF404F4E).withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Color(0xFFB1CFCD).withOpacity(0.6),
            child: widget,
          ),
        ),
      ),
    );
  }



  Widget _buildCurrentWeather(Weather weather, bool isDayTime) {
    return Container(
      padding: EdgeInsets.all(25),
      color: Color(0xFF4F8677).withOpacity(1),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text('${weather.temperature}°C', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Color(
              0xE6FCFCFC))),
          SizedBox(height: 10),
          Icon(
            isDayTime ? Icons.wb_sunny : Icons.nightlight_round,
            color: isDayTime ? Color(0xFFFFA500) : Color(0xFF4646DC),
            size: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildForecastBox(List<dynamic> forecast, int dayIndex) {
    if (forecast == null || forecast.length <= dayIndex) {
      return Container();
    }

    var tomorrowData = forecast[dayIndex]['day'];
    var afterTomorrowData = forecast[dayIndex + 1]['day'];

    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    DateTime dayAfterTomorrow = DateTime.now().add(Duration(days: 2));

    String formattedTomorrowDate = '${tomorrow.day}/${tomorrow.month}/${tomorrow.year}';
    String formattedDayAfterTomorrowDate = '${dayAfterTomorrow.day}/${dayAfterTomorrow.month}/${dayAfterTomorrow.year}';

    return Container(
      padding: EdgeInsets.all(29),
      color: Color(0xFF4F8677).withOpacity(1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildForecastItem(formattedTomorrowDate, tomorrowData['mintemp_c'].toDouble(), tomorrowData['maxtemp_c'].toDouble()),
              _buildForecastItem(formattedDayAfterTomorrowDate, afterTomorrowData['mintemp_c'].toDouble(), afterTomorrowData['maxtemp_c'].toDouble()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForecastItem(String date, double minTemp, double maxTemp) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Color(0xFF4F8677).withOpacity(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(
              0xE6FCFCFC))),
          SizedBox(height: 6),
          Text('Min Temp: ${minTemp.toStringAsFixed(1)}°C',style: TextStyle(color: Color(
              0xE6FCFCFC)),),
          SizedBox(height: 6),
          Text('Max Temp: ${maxTemp.toStringAsFixed(1)}°C',style: TextStyle(color: Color(
              0xE6FCFCFC))),
        ],
      ),
    );
  }

  Widget _buildInfoRow(Weather weather) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Color(0xFF4F8677).withOpacity(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoBox('Wind Speed', '${weather.windSpeed} m/s', Icons.waves),
          SizedBox(height: 10),
          _buildInfoBox('Humidity', '${weather.humidity}%', Icons.water_drop),
          SizedBox(height: 10),
          _buildInfoBox('Min Temp', '${weather.minTemp}°C', Icons.arrow_downward),
          SizedBox(height: 10),
          _buildInfoBox('Max Temp', '${weather.maxTemp}°C', Icons.arrow_upward),
          SizedBox(height: 10),
        ],
      ),

    );
  }

  Widget _buildInfoBox(String title, String value, IconData iconData) {
    return Column(
      children: [
        Icon(iconData, color: Colors.white, size: 25),
        SizedBox(height: 10),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white)),
        SizedBox(height: 10),
        Text(value, style: TextStyle(fontSize: 15,color: Colors.white)),
      ],
    );
  }

  Widget _buildBottomNavItem(IconData iconData, String label, VoidCallback onPressed) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.white, size: 28),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  bool _isDayTime(Weather weather) {
    var now = DateTime.now().hour;
    return now >= 6 && now < 18;
  }

  _showCitySelectionDialog() {
    TextEditingController _cityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Location'),
          contentPadding: EdgeInsets.all(16.0),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(hintText: 'Enter Your Location'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedCity = _cityController.text;
                  futureWeather = apiService.fetchWeather(selectedCity);
                  Navigator.pop(context);
                });
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WeatherPage(),
  ));
}
