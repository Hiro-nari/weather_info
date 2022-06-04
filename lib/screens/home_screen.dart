import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_info/data_class/location.dart';

import '../main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Location? location;

    final state = ref.watch(positionProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(state.toString()),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: ()  {
                  ref.read(positionProvider.notifier).getLocation();
                },
                child: const Text("現在地情報を取得する"),
              ),
          ),
        ],
      ),
    );
  }

}
