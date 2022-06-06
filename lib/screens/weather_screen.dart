
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_info/common/weather_repository.dart';
import 'package:weather_info/data_class/location.dart';
import 'package:weather_info/data_class/weather.dart';

class WeatherScreen extends ConsumerWidget {
  final Location location;
  const WeatherScreen( this.location, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final weather = ref.watch(weatherProvider);
     ref.read(weatherProvider.notifier).getWeather(location);

    return Scaffold(
      appBar: AppBar(
        title:  Text("${location.city}の天気情報"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("天気", style: TextStyle(fontSize: 20),),
               ),
              ///天気アイコン
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _handleIcon(context, weather),
              ),
              ///天気
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(weather.main,style: const TextStyle(fontSize: 35),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("気温",style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${weather.temp} ℃",style: const TextStyle(fontSize: 35),),
              ),
            ],
          ),

        ],
      ),
    );
  }

Widget  _handleIcon(BuildContext context, Weather weather) {

    if(weather.main.contains("晴")){
      return const Icon(Icons.wb_sunny,size: 30.0,);
    }else if(weather.main.contains("曇")){
      return const Icon(Icons.cloud,size: 30.0,);
    }else if(weather.main.contains("雨")) {
      return const Icon(Icons.umbrella,size: 30.0,);
    }else{
      return Container();
    }

}


}
