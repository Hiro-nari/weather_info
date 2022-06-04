

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_info/screens/home_screen.dart';
import 'package:weather_info/screens/weather_screen.dart';

import 'common/utils.dart';
import 'data_class/location.dart';
import 'main.gr.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;


final positionProvider = StateNotifierProvider((_) => PositionNotifier());

class PositionNotifier extends StateNotifier<Location> {
  PositionNotifier() : super(const Location(longitude: 0.0, latitude: 0.0, city: '', state: '', country: ''));


  void getLocation() async{
   // await getCurrentLocation();

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
}


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {


    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: "お天気インフォ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
      ),
      //androidのバックボタンでアプリが消されない
      backButtonDispatcher: RootBackButtonDispatcher(),

    );
  }
}



@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[

    AutoRoute(
      path: '/',
      page: HomeScreen,
      name: 'HomeScreenRouter',
      initial: true,
    ),

    AutoRoute(
      path: '/home/weather_info',
      name: 'WeatherScreenRouter',
      page: WeatherScreen,
    ),


    RedirectRoute(path: '*', redirectTo: '/'),

  ],
)



class $AppRouter {}
// class AppRouter extends _$AppRouter{}


//ルートを自動生成するコマンド
//fvm flutter packages pub run build_runner build

//コンフリクトを解消するコマンド
//fvm flutter pub run build_runner build --delete-conflicting-outputs