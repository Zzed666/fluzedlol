import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel extends Object{

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'imageUrl')
  String imageUrl;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  BannerModel(this.type,this.id,this.title,this.desc,this.imageUrl,this.linkUrl);

  factory BannerModel.fromJson(Map<String, dynamic> srcJson) => _$BannerModelFromJson(srcJson);

}


