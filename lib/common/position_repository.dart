
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_info/common/utils.dart';
import 'package:weather_info/data_class/location.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;

final positionProvider = StateNotifierProvider<PositionNotifier, Location>(
      (ref) => PositionNotifier( const Location(longitude: 0.0, latitude: 0.0, city: '', state: '', country: '')),
);

class PositionNotifier extends StateNotifier<Location> {
  PositionNotifier(Location state) : super(state);


  void getLocation() async{

    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return Future.error("位置情報サービスがオフになっています");
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("位置情報へのアクセスをユーザーが拒否しました");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("位置情報へのアクセスが永遠に拒否されています");
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final placeMarks = await geoCoding.placemarkFromCoordinates(
        position.latitude, position.longitude);
    final placeMark = placeMarks.first;
    final location = await Future.value(convert(placeMark, position));

    state = Location(city: location.city, longitude: location.longitude, state: location.state, country: location.country, latitude: location.longitude);

  }

  void refreshLocation(){
    state = const Location(city: "", longitude: 0.0, state: "", country: "", latitude: 0.0);
  }


}