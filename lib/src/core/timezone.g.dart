// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeZone _$TimeZoneFromJson(Map<String, dynamic> json) {
  return TimeZone(
    name: json['name'],
    possibleOffsets: json['offsets'],
    possibleAbbrs: json['abbrs'],
    history: TimeZone._historyFromJson(json['info'] as List),
  );
}

Map<String, dynamic> _$TimeZoneToJson(TimeZone instance) => <String, dynamic>{
      'name': instance.name,
      'offsets': instance.possibleOffsets,
      'abbrs': instance.possibleAbbrs,
      'info': instance.history,
    };

TimeZoneHistory _$TimeZoneHistoryFromJson(Map<String, dynamic> json) {
  return TimeZoneHistory(
    index: json['index'],
    until: TimeZoneHistory._untilFromJson(json['until'] as int),
  );
}

Map<String, dynamic> _$TimeZoneHistoryToJson(TimeZoneHistory instance) =>
    <String, dynamic>{
      'index': instance.index,
      'until': instance.until,
    };
