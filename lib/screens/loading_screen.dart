import 'package:flutter/material.dart';
import 'package:live_weather/services/location.dart';
import 'package:http/http.dart'as http;
const apiKey = '376b126ca0f4fb505f04ab86f7264095';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    location.getCurrentLocation();
  }

  void getData()async{
    var response= await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=$apiKey"));
    print(response.body);

  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            getLocation();
            //Get the current location
          },
          child: Container(
            child: Center(child: Text('Get Location',style: TextStyle(color: Colors.black),)),
            height: 50,
            width: 120,
            color: Colors.cyanAccent,
          )
        ),
      ),
    );
  }
}
