// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutModel _$AboutModelFromJson(Map<String, dynamic> json) => AboutModel(
      appTitle: json['appTitle'] as String,
      appDescription: json['appDescription'] as String,
      mission: json['mission'] as String,
      vision: json['vision'] as String,
      contactInfo: json['contactInfo'] as Map<String, dynamic>,
      socialMediaLinks: (json['socialMediaLinks'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AboutModelToJson(AboutModel instance) =>
    <String, dynamic>{
      'appTitle': instance.appTitle,
      'appDescription': instance.appDescription,
      'mission': instance.mission,
      'vision': instance.vision,
      'contactInfo': instance.contactInfo,
      'socialMediaLinks': instance.socialMediaLinks,
    };
