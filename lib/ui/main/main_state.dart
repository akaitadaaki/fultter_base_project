// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/sample_data.dart';

part 'generated/main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    required AsyncValue<List<SampleData>> sampleList,
  }) = _MainState;
}
