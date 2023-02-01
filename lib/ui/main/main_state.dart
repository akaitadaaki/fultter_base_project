// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/test_data.dart';

part 'generated/main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    required String inputName,
    required String inputDescription,
    required AsyncValue<List<TestData>> testList,
  }) = _MainState;
}
