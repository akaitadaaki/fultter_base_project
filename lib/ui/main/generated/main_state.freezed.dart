// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  String get inputName => throw _privateConstructorUsedError;
  String get inputDescription => throw _privateConstructorUsedError;
  AsyncValue<List<SampleData>> get sampleList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {String inputName,
      String inputDescription,
      AsyncValue<List<SampleData>> sampleList});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputName = null,
    Object? inputDescription = null,
    Object? sampleList = null,
  }) {
    return _then(_value.copyWith(
      inputName: null == inputName
          ? _value.inputName
          : inputName // ignore: cast_nullable_to_non_nullable
              as String,
      inputDescription: null == inputDescription
          ? _value.inputDescription
          : inputDescription // ignore: cast_nullable_to_non_nullable
              as String,
      sampleList: null == sampleList
          ? _value.sampleList
          : sampleList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SampleData>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$$_MainStateCopyWith(
          _$_MainState value, $Res Function(_$_MainState) then) =
      __$$_MainStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String inputName,
      String inputDescription,
      AsyncValue<List<SampleData>> sampleList});
}

/// @nodoc
class __$$_MainStateCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$_MainState>
    implements _$$_MainStateCopyWith<$Res> {
  __$$_MainStateCopyWithImpl(
      _$_MainState _value, $Res Function(_$_MainState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputName = null,
    Object? inputDescription = null,
    Object? sampleList = null,
  }) {
    return _then(_$_MainState(
      inputName: null == inputName
          ? _value.inputName
          : inputName // ignore: cast_nullable_to_non_nullable
              as String,
      inputDescription: null == inputDescription
          ? _value.inputDescription
          : inputDescription // ignore: cast_nullable_to_non_nullable
              as String,
      sampleList: null == sampleList
          ? _value.sampleList
          : sampleList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SampleData>>,
    ));
  }
}

/// @nodoc

class _$_MainState implements _MainState {
  _$_MainState(
      {required this.inputName,
      required this.inputDescription,
      required this.sampleList});

  @override
  final String inputName;
  @override
  final String inputDescription;
  @override
  final AsyncValue<List<SampleData>> sampleList;

  @override
  String toString() {
    return 'MainState(inputName: $inputName, inputDescription: $inputDescription, sampleList: $sampleList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainState &&
            (identical(other.inputName, inputName) ||
                other.inputName == inputName) &&
            (identical(other.inputDescription, inputDescription) ||
                other.inputDescription == inputDescription) &&
            (identical(other.sampleList, sampleList) ||
                other.sampleList == sampleList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, inputName, inputDescription, sampleList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      __$$_MainStateCopyWithImpl<_$_MainState>(this, _$identity);
}

abstract class _MainState implements MainState {
  factory _MainState(
      {required final String inputName,
      required final String inputDescription,
      required final AsyncValue<List<SampleData>> sampleList}) = _$_MainState;

  @override
  String get inputName;
  @override
  String get inputDescription;
  @override
  AsyncValue<List<SampleData>> get sampleList;
  @override
  @JsonKey(ignore: true)
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      throw _privateConstructorUsedError;
}
