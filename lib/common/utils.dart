

import 'package:geolocator/geolocator.dart';
import 'package:weather_info/data_class/location.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;



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