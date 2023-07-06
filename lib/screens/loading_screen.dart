import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied
        print('Location permission denied');
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(position);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  // void getLocation()async{
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //     print(position);
  // }
  @override
  Widget build(BuildContext context) {
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
