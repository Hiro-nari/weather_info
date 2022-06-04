

import 'package:geolocator/geolocator.dart';
import 'package:weather_info/data_class/location.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;



// Future<Location> getCurrentLocation() async {
//   final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
//
//   if (!isLocationEnabled) {
//     return Future.error("位置情報サービスがオフになっています");
//   }
//
//   var permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error("位置情報へのアクセスをユーザーが拒否しました");
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error("位置情報へのアクセスが永遠に拒否されています");
//   }
//
//   final position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//   final placeMarks = await geoCoding.placemarkFromCoordinates(
//       position.latitude, position.longitude);
//   final placeMark = placeMarks.first;
//   return  Future.value(convert(placeMark, position));
//
//
// }

Location convert(geoCoding.Placemark placeMark, Position position) {

  final location = Location(
    latitude: position.latitude,
    longitude: position.longitude,
    country: placeMark.country ?? "",
    state: placeMark.administrativeArea ?? "",
    city: placeMark.locality ?? "",
  );

  print("現在位置情報 $location");

  return location;

}