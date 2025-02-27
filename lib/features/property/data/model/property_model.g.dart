// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      id: json['id'] as int,
      title: json['title'] as String,
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      price: (json['price'] as num).toDouble(),
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      size: (json['size'] as num?)?.toDouble(),
      nearbyPlaces: (json['nearbyPlaces'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      description: json['description'] as String?,
      city: json['city'] as String?,
      isForSale: json['isForSale'] as bool?,
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'price': instance.price,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'size': instance.size,
      'nearbyPlaces': instance.nearbyPlaces,
      'description': instance.description,
      'city': instance.city,
      'isForSale': instance.isForSale,
    };