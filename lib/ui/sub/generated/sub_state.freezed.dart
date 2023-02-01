// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../sub_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubState {
  int get id => throw _privateConstructorUsedError;
  AsyncValue<TestData?> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubStateCopyWith<SubState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubStateCopyWith<$Res> {
  factory $SubStateCopyWith(SubState value, $Res Function(SubState) then) =
      _$SubStateCopyWithImpl<$Res, SubState>;
  @useResult
  $Res call({int id, AsyncValue<TestData?> data});
}

/// @nodoc
class _$SubStateCopyWithImpl<$Res, $Val extends SubState>
    implements $SubStateCopyWith<$Res> {
  _$SubStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TestData?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubStateCopyWith<$Res> implements $SubStateCopyWith<$Res> {
  factory _$$_SubStateCopyWith(
          _$_SubState value, $Res Function(_$_SubState) then) =
      __$$_SubStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, AsyncValue<TestData?> data});
}

/// @nodoc
class __$$_SubStateCopyWithImpl<$Res>
    extends _$SubStateCopyWithImpl<$Res, _$_SubState>
    implements _$$_SubStateCopyWith<$Res> {
  __$$_SubStateCopyWithImpl(
      _$_SubState _value, $Res Function(_$_SubState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
  }) {
    return _then(_$_SubState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TestData?>,
    ));
  }
}

/// @nodoc

class _$_SubState implements _SubState {
  _$_SubState({required this.id, required this.data});

  @override
  final int id;
  @override
  final AsyncValue<TestData?> data;

  @override
  String toString() {
    return 'SubState(id: $id, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubStateCopyWith<_$_SubState> get copyWith =>
      __$$_SubStateCopyWithImpl<_$_SubState>(this, _$identity);
}

abstract class _SubState implements SubState {
  factory _SubState(
      {required final int id,
      required final AsyncValue<TestData?> data}) = _$_SubState;

  @override
  int get id;
  @override
  AsyncValue<TestData?> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SubStateCopyWith<_$_SubState> get copyWith =>
      throw _privateConstructorUsedError;
}
