import 'package:freezed_annotation/freezed_annotation.dart';
// {ファイル名}.freezed.dart　と書く
import 'package:flutter/foundation.dart';
part 'weather.freezed.dart';
// JSON用の生成コード
part 'weather.g.dart';


//Freezed特有の書き方なので、スニペットを用意するのが良い
@freezed
class Weather with _$Weather {
  const Weather._();
  const factory Weather({
    required String city,
    required String temp,
    required String main,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}


//ファイル生成コマンド
//fvm flutter packages pub run build_runner build --delete-conflicting-outputs
// fvm flutter pub run build_runner build