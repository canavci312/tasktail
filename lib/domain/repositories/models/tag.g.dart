// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      name: json['name'] as String,
      color: $enumDecodeNullable(_$TagColorEnumMap, json['color']) ??
          TagColor.noColor,
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'name': instance.name,
      'color': _$TagColorEnumMap[instance.color]!,
    };

const _$TagColorEnumMap = {
  TagColor.noColor: 'noColor',
  TagColor.red: 'red',
  TagColor.redAccent: 'redAccent',
  TagColor.orange: 'orange',
  TagColor.orangeAccent: 'orangeAccent',
  TagColor.yellow: 'yellow',
  TagColor.yellowAccent: 'yellowAccent',
  TagColor.green: 'green',
  TagColor.greenAccent: 'greenAccent',
  TagColor.blue: 'blue',
  TagColor.blueAccent: 'blueAccent',
  TagColor.purple: 'purple',
  TagColor.purpleAccent: 'purpleAccent',
  TagColor.pink: 'pink',
  TagColor.pinkAccent: 'pinkAccent',
  TagColor.brown: 'brown',
  TagColor.blueGray: 'blueGray',
  TagColor.grey: 'grey',
};
