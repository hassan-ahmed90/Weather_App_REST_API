import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:live_weather/screens/location_screen.dart';
import 'package:live_weather/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // void getLocation() async {
  //   Location location = Location();
  //   location.getCurrentLocation();
  // }

  void getLocationData()async{
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    // var response= await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=$apiKey"));
    // print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}