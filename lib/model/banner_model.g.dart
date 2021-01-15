// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  if (json == null) return null;
  return BannerModel(
    json['type'] as int,
    json['id'] as int,
    json['title'] as String,
    json['desc'] as String,
    json['imageUrl'] as String,
    json['linkUrl'] as String,
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'linkUrl': instance.linkUrl,
    };
