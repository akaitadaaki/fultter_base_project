// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_state.freezed.dart';

@freezed
class TestState with _$TestState {
  factory TestState({
    required String inputName,
    required String inputDescription,
  }) = _TestState;
}
