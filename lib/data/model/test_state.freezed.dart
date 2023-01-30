// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TestStateTearOff {
  const _$TestStateTearOff();

  _TestState call(
      {required String inputName, required String inputDescription}) {
    return _TestState(
      inputName: inputName,
      inputDescription: inputDescription,
    );
  }
}

/// @nodoc
const $TestState = _$TestStateTearOff();

/// @nodoc
mixin _$TestState {
  String get inputName => throw _privateConstructorUsedError;
  String get inputDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestStateCopyWith<TestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestStateCopyWith<$Res> {
  factory $TestStateCopyWith(TestState value, $Res Function(TestState) then) =
      _$TestStateCopyWithImpl<$Res>;
  $Res call({String inputName, String inputDescription});
}

/// @nodoc
class _$TestStateCopyWithImpl<$Res> implements $TestStateCopyWith<$Res> {
  _$TestStateCopyWithImpl(this._value, this._then);

  final TestState _value;
  // ignore: unused_field
  final $Res Function(TestState) _then;

  @override
  $Res call({
    Object? inputName = freezed,
    Object? inputDescription = freezed,
  }) {
    return _then(_value.copyWith(
      inputName: inputName == freezed
          ? _value.inputName
          : inputName // ignore: cast_nullable_to_non_nullable
              as String,
      inputDescription: inputDescription == freezed
          ? _value.inputDescription
          : inputDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TestStateCopyWith<$Res> implements $TestStateCopyWith<$Res> {
  factory _$TestStateCopyWith(
          _TestState value, $Res Function(_TestState) then) =
      __$TestStateCopyWithImpl<$Res>;
  @override
  $Res call({String inputName, String inputDescription});
}

/// @nodoc
class __$TestStateCopyWithImpl<$Res> extends _$TestStateCopyWithImpl<$Res>
    implements _$TestStateCopyWith<$Res> {
  __$TestStateCopyWithImpl(_TestState _value, $Res Function(_TestState) _then)
      : super(_value, (v) => _then(v as _TestState));

  @override
  _TestState get _value => super._value as _TestState;

  @override
  $Res call({
    Object? inputName = freezed,
    Object? inputDescription = freezed,
  }) {
    return _then(_TestState(
      inputName: inputName == freezed
          ? _value.inputName
          : inputName // ignore: cast_nullable_to_non_nullable
              as String,
      inputDescription: inputDescription == freezed
          ? _value.inputDescription
          : inputDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TestState implements _TestState {
  _$_TestState({required this.inputName, required this.inputDescription});

  @override
  final String inputName;
  @override
  final String inputDescription;

  @override
  String toString() {
    return 'TestState(inputName: $inputName, inputDescription: $inputDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TestState &&
            const DeepCollectionEquality().equals(other.inputName, inputName) &&
            const DeepCollectionEquality()
                .equals(other.inputDescription, inputDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inputName),
      const DeepCollectionEquality().hash(inputDescription));

  @JsonKey(ignore: true)
  @override
  _$TestStateCopyWith<_TestState> get copyWith =>
      __$TestStateCopyWithImpl<_TestState>(this, _$identity);
}

abstract class _TestState implements TestState {
  factory _TestState(
      {required String inputName,
      required String inputDescription}) = _$_TestState;

  @override
  String get inputName;
  @override
  String get inputDescription;
  @override
  @JsonKey(ignore: true)
  _$TestStateCopyWith<_TestState> get copyWith =>
      throw _privateConstructorUsedError;
}
