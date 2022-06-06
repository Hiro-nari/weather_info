// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'data_class/location.dart' as _i5;
import 'screens/home_screen.dart' as _i1;
import 'screens/weather_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreenRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    WeatherScreenRouter.name: (routeData) {
      final args = routeData.argsAs<WeatherScreenRouterArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.WeatherScreen(args.location, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeScreenRouter.name, path: '/'),
        _i3.RouteConfig(WeatherScreenRouter.name, path: '/home/weather_info'),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRouter extends _i3.PageRouteInfo<void> {
  const HomeScreenRouter() : super(HomeScreenRouter.name, path: '/');

  static const String name = 'HomeScreenRouter';
}

/// generated route for
/// [_i2.WeatherScreen]
class WeatherScreenRouter extends _i3.PageRouteInfo<WeatherScreenRouterArgs> {
  WeatherScreenRouter({required _i5.Location location, _i4.Key? key})
      : super(WeatherScreenRouter.name,
            path: '/home/weather_info',
            args: WeatherScreenRouterArgs(location: location, key: key));

  static const String name = 'WeatherScreenRouter';
}

class WeatherScreenRouterArgs {
  const WeatherScreenRouterArgs({required this.location, this.key});

  final _i5.Location location;

  final _i4.Key? key;

  @override
  String toString() {
    return 'WeatherScreenRouterArgs{location: $location, key: $key}';
  }
}
