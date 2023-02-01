// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../foundation/utils/date_time_converter.dart';

part 'generated/sample_data.freezed.dart';
part 'generated/sample_data.g.dart';

@freezed
class SampleData with _$SampleData {
  factory SampleData({
    @JsonKey(name: 'dataId') required int id,
    @JsonKey(name: 'dataName') required String name,
    required String description,
    @DateTimeConverter() required DateTime lastUpdate,
  }) = _SampleData;

  factory SampleData.fromJson(Map<String, dynamic> json) => _$SampleDataFromJson(json);
}
