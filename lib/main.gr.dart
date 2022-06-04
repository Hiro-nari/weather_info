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
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WeatherScreen());
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
class WeatherScreenRouter extends _i3.PageRouteInfo<void> {
  const WeatherScreenRouter()
      : super(WeatherScreenRouter.name, path: '/home/weather_info');

  static const String name = 'WeatherScreenRouter';
}
