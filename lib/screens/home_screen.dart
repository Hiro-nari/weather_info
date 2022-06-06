

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_info/common/position_repository.dart';
import 'package:weather_info/common/weather_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weather_info/data_class/location.dart';

import '../main.gr.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final location = ref.watch(positionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("お天気情報")),
        actions: [
          IconButton(
              onPressed: ()=> _refresh(context,ref),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          location.city.isEmpty
          ? Container()
          : Center(child: Column(
            children: [
              const Text("あなたの現在地は",style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold ),),
              Text("${location.city} です",style: const TextStyle(fontSize: 30.0 ,fontWeight:FontWeight.bold ),),
            ],
          )),

          ///位置情報取得ボタン
          location.city.isEmpty
         ? Center(
            child: TextButton(
                onPressed: ()  {
                  ref.read(positionProvider.notifier).getLocation();
                },
                child: const Text("現在地情報を取得する",style: TextStyle(fontSize: 20.0),),
              ),
          )
          : Container(),

          ///天気情報取得ボタン
          location.city.isEmpty
          ? Container()
         : Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: ()  {
                _openWeatherScreen(context,location);
              },
              child: const Text("現在地の天気を取得する",style: TextStyle(fontSize: 20.0,color: Colors.blue),),
            ),
          ),
        ],
      ),
    );
  }

  void _openWeatherScreen(BuildContext context,Location location) {

    context.router.push( WeatherScreenRouter(location: location));

  }

  _refresh(BuildContext context, WidgetRef ref) {

    ref.read(positionProvider.notifier).refreshLocation();

  }

}
