import 'package:freezed_annotation/freezed_annotation.dart';
// {ファイル名}.freezed.dart　と書く
import 'package:flutter/foundation.dart';
part 'location.freezed.dart';
// JSON用の生成コード
part 'location.g.dart';


//Freezed特有の書き方なので、スニペットを用意するのが良い
@freezed
class Location with _$Location {
  const Location._();
  const factory Location({
    required double latitude, //requiredで必須項目にする
    required double longitude,
    required String country,
    required String state,
    required String city,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}


//ファイル生成コマンド
//fvm flutter packages pub run build_runner build --delete-conflicting-outputs
// fvm flutter pub run build_runner build