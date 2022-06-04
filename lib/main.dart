import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_info/screens/home_screen.dart';
import 'package:weather_info/screens/weather_screen.dart';

import 'main.gr.dart';

final weatherProvider = StateNotifierProvider((ref) {
  return Weather();
});

class Weather extends StateNotifier<int> {
  Weather(): super(0);

  //TODO　メソッドを指定
  void increment() => state++;
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