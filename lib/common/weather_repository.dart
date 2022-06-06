

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:weather_info/data_class/location.dart';
import 'package:weather_info/data_class/weather.dart';

final weatherProvider = StateNotifierProvider<WeatherNotifier, Weather>(
      (ref) => WeatherNotifier( const Weather( city: '',temp: "",main: "",)),
);

class WeatherNotifier extends StateNotifier<Weather> {
  WeatherNotifier(Weather state) : super(state);


  Future<void> getWeather(Location location) async{

    //APIキー
   const appId = "19d951841ccda2bd153a5891095f28f4";

    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=${location.city}&appid=${appId}&lat=${location.latitude}&lon=${location.longitude}&lang=ja&units=metric";

    ///httpのgetメソッドが何度も走ってしまう。他に防止する方法はないか。
    if(state.main.isEmpty){
      final response = await get(Uri.parse(Uri.encodeFull((finalUrl))));
      print("URL: ${Uri.encodeFull(finalUrl)}");

      if (response.statusCode == 200) {

        final data = json.decode(response.body);
        final temp = data["list"][1]["main"]["temp"];
        final main = data["list"][1]["weather"][0]["description"];

        state = Weather(city: location.city, main: main, temp: temp.toString());

        print("state $state");

      }else {
        throw Exception("Error getting weather forecast");
      }
    }else{
      print("データが取れています");
    }


  }
}
