// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      languageCode: json['languageCode'] as String,
      theme: json['theme'] as String,
      scriptCode: json['scriptCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'theme': instance.theme,
      'scriptCode': instance.scriptCode,
      'countryCode': instance.countryCode,
    };
