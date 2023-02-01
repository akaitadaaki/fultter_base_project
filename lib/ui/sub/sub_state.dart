// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/sample_data.dart';

part 'generated/sub_state.freezed.dart';

@freezed
class SubState with _$SubState {
  factory SubState({
    required int id,
    required AsyncValue<SampleData?> data,
  }) = _SubState;
}
