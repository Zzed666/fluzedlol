// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel(
    json['type'] as int,
    json['imageThumbnail'] as String,
    json['title'] as String,
    json['content'] as String,
    json['linkUrl'] as String
  );
}

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'imageThumbnail': instance.imageThumbnail,
      'title': instance.title,
      'content': instance.content,
      'linkUrl': instance.linkUrl
    };
