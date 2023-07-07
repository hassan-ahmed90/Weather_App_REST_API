import 'package:geolocator/geolocator.dart';

class Location{
  double? longitude;
  double? latitude;
  Future<void> getCurrentLocation() async {
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
      longitude=position.longitude;
      latitude=position.latitude;
      print(position.latitude);
      print(position.longitude);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

}