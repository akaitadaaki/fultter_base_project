// ignore_for_file: non_constant_identifier_names
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
_$_TestData _$$_TestDataFromJson(Map<String, dynamic> json) => _$_TestData(
      id: json['dataId'] as int,
      name: json['dataName'] as String,
      description: json['description'] as String,
      lastUpdate: const DateTimeConverter().fromJson(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$$_TestDataToJson(_$_TestData instance) => <String, dynamic>{
      'dataId': instance.id,
      'dataName': instance.name,
      'description': instance.description,
      'lastUpdate': const DateTimeConverter().toJson(instance.lastUpdate),
    };
