// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestData _$TestDataFromJson(Map<String, dynamic> json) {
  return _TestData.fromJson(json);
}

/// @nodoc
class _$TestDataTearOff {
  const _$TestDataTearOff();

  _TestData call(
      {@JsonKey(name: 'dataId') required int id,
      @JsonKey(name: 'dataName') required String name,
      required String description,
      @DateTimeConverter() required DateTime lastUpdate}) {
    return _TestData(
      id: id,
      name: name,
      description: description,
      lastUpdate: lastUpdate,
    );
  }

  TestData fromJson(Map<String, Object?> json) {
    return TestData.fromJson(json);
  }
}

/// @nodoc
const $TestData = _$TestDataTearOff();

/// @nodoc
mixin _$TestData {
  @JsonKey(name: 'dataId')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataName')
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestDataCopyWith<TestData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestDataCopyWith<$Res> {
  factory $TestDataCopyWith(TestData value, $Res Function(TestData) then) =
      _$TestDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'dataId') int id,
      @JsonKey(name: 'dataName') String name,
      String description,
      @DateTimeConverter() DateTime lastUpdate});
}

/// @nodoc
class _$TestDataCopyWithImpl<$Res> implements $TestDataCopyWith<$Res> {
  _$TestDataCopyWithImpl(this._value, this._then);

  final TestData _value;
  // ignore: unused_field
  final $Res Function(TestData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TestDataCopyWith<$Res> implements $TestDataCopyWith<$Res> {
  factory _$TestDataCopyWith(_TestData value, $Res Function(_TestData) then) =
      __$TestDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'dataId') int id,
      @JsonKey(name: 'dataName') String name,
      String description,
      @DateTimeConverter() DateTime lastUpdate});
}

/// @nodoc
class __$TestDataCopyWithImpl<$Res> extends _$TestDataCopyWithImpl<$Res>
    implements _$TestDataCopyWith<$Res> {
  __$TestDataCopyWithImpl(_TestData _value, $Res Function(_TestData) _then)
      : super(_value, (v) => _then(v as _TestData));

  @override
  _TestData get _value => super._value as _TestData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_TestData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestData implements _TestData {
  _$_TestData(
      {@JsonKey(name: 'dataId') required this.id,
      @JsonKey(name: 'dataName') required this.name,
      required this.description,
      @DateTimeConverter() required this.lastUpdate});

  factory _$_TestData.fromJson(Map<String, dynamic> json) =>
      _$$_TestDataFromJson(json);

  @override
  @JsonKey(name: 'dataId')
  final int id;
  @override
  @JsonKey(name: 'dataName')
  final String name;
  @override
  final String description;
  @override
  @DateTimeConverter()
  final DateTime lastUpdate;

  @override
  String toString() {
    return 'TestData(id: $id, name: $name, description: $description, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TestData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdate, lastUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(lastUpdate));

  @JsonKey(ignore: true)
  @override
  _$TestDataCopyWith<_TestData> get copyWith =>
      __$TestDataCopyWithImpl<_TestData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestDataToJson(this);
  }
}

abstract class _TestData implements TestData {
  factory _TestData(
      {@JsonKey(name: 'dataId') required int id,
      @JsonKey(name: 'dataName') required String name,
      required String description,
      @DateTimeConverter() required DateTime lastUpdate}) = _$_TestData;

  factory _TestData.fromJson(Map<String, dynamic> json) = _$_TestData.fromJson;

  @override
  @JsonKey(name: 'dataId')
  int get id;
  @override
  @JsonKey(name: 'dataName')
  String get name;
  @override
  String get description;
  @override
  @DateTimeConverter()
  DateTime get lastUpdate;
  @override
  @JsonKey(ignore: true)
  _$TestDataCopyWith<_TestData> get copyWith =>
      throw _privateConstructorUsedError;
}
