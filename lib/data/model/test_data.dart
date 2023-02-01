// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../foundation/utils/date_time_converter.dart';

part 'generated/test_data.freezed.dart';
part 'generated/test_data.g.dart';

@freezed
class TestData with _$TestData {
  factory TestData({
    @JsonKey(name: 'dataId') required int id,
    @JsonKey(name: 'dataName') required String name,
    required String description,
    @DateTimeConverter() required DateTime lastUpdate,
  }) = _TestData;

  factory TestData.fromJson(Map<String, dynamic> json) => _$TestDataFromJson(json);
}
