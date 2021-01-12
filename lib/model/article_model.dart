import 'package:json_annotation/json_annotation.dart';
part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Object{

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'imageThumbnail')
  String imageThumbnail;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  ArticleModel(this.type,this.imageThumbnail,this.title,this.content,this.tag,this.linkUrl);

  factory ArticleModel.fromJson(Map<String, dynamic> srcJson) => _$ArticleModelFromJson(srcJson);

}


