import 'package:freezed_annotation/freezed_annotation.dart';
// {ファイル名}.freezed.dart　と書く
import 'package:flutter/foundation.dart';
part 'location.freezed.dart';


//Freezed特有の書き方なので、スニペットを用意するのが良い
@freezed
class Location with _$Location {
  const Location._();
  const factory Location({
    required double latitude, //requiredで必須項目にする
    required double longitude,
  }) = _Location;
}

//ファイル生成コマンド
//fvm flutter packages pub run build_runner build --delete-conflicting-outputs