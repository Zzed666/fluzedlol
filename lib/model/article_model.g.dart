// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  if (json == null) return null;
  return ArticleModel(
    json['type'] as int,
    json['authorName'] as String,
    json['authorAvatar'] as String,
    json['imageThumbnail'] as String,
    json['title'] as String,
    json['content'] as String,
    json['tag'] as String,
    json['commentNum'] as int,
    json['likeNum'] as int,
    json['linkUrl'] as String,
  );
}

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'authorName': instance.authorName,
      'authorAvatar': instance.authorAvatar,
      'imageThumbnail': instance.imageThumbnail,
      'title': instance.title,
      'content': instance.content,
      'tag': instance.tag,
      'commentNum': instance.commentNum,
      'likeNum': instance.likeNum,
      'linkUrl': instance.linkUrl,
    };
