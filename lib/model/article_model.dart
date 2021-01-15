import 'package:json_annotation/json_annotation.dart';
part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Object{

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'authorName')
  String authorName;

  @JsonKey(name: 'authorAvatar')
  String authorAvatar;

  @JsonKey(name: 'imageThumbnail')
  String imageThumbnail;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'commentNum')
  int commentNum;

  @JsonKey(name: 'likeNum')
  int likeNum;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  ArticleModel(this.type,this.authorName,this.authorAvatar,this.imageThumbnail,this.title,this.content,this.tag,this.commentNum,this.likeNum,this.linkUrl);

  factory ArticleModel.fromJson(Map<String, dynamic> srcJson) => _$ArticleModelFromJson(srcJson);

}


