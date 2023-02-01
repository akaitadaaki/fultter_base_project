// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sample_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SampleData _$$_SampleDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SampleData',
      json,
      ($checkedConvert) {
        final val = _$_SampleData(
          id: $checkedConvert('dataId', (v) => v as int),
          name: $checkedConvert('dataName', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          lastUpdate: $checkedConvert('last_update',
              (v) => const DateTimeConverter().fromJson(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'dataId',
        'name': 'dataName',
        'lastUpdate': 'last_update'
      },
    );

Map<String, dynamic> _$$_SampleDataToJson(_$_SampleData instance) =>
    <String, dynamic>{
      'dataId': instance.id,
      'dataName': instance.name,
      'description': instance.description,
      'last_update': const DateTimeConverter().toJson(instance.lastUpdate),
    };
