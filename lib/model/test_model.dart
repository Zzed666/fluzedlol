import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';


@JsonSerializable()
class TestModel extends Object {

  @JsonKey(name: 'accountNumber')
  String accountNumber;

  @JsonKey(name: 'accountName')
  String accountName;

  @JsonKey(name: 'accountHeadPortrait')
  String accountHeadPortrait;

  @JsonKey(name: 'accountAge')
  int accountAge;

  @JsonKey(name: 'accountGender')
  String accountGender;

  @JsonKey(name: 'accountLevel')
  int accountLevel;

  @JsonKey(name: 'accountPersonal')
  AccountPersonal accountPersonal;

  @JsonKey(name: 'accountUnread')
  AccountUnread accountUnread;

  TestModel(this.accountNumber,this.accountName,this.accountHeadPortrait,this.accountAge,this.accountGender,this.accountLevel,this.accountPersonal,this.accountUnread,);

  factory TestModel.fromJson(Map<String, dynamic> srcJson) => _$TestModelFromJson(srcJson);

}


@JsonSerializable()
class AccountPersonal extends Object {

  @JsonKey(name: 'attentions')
  int attentions;

  @JsonKey(name: 'fans')
  int fans;

  @JsonKey(name: 'goodFriends')
  int goodFriends;

  @JsonKey(name: 'publishes')
  int publishes;

  AccountPersonal(this.attentions,this.fans,this.goodFriends,this.publishes,);

  factory AccountPersonal.fromJson(Map<String, dynamic> srcJson) => _$AccountPersonalFromJson(srcJson);

}


@JsonSerializable()
class AccountUnread extends Object {

  @JsonKey(name: 'relations')
  int relations;

  @JsonKey(name: 'actions')
  int actions;

  @JsonKey(name: 'orders')
  int orders;

  @JsonKey(name: 'tasks')
  int tasks;

  @JsonKey(name: 'collections')
  int collections;

  @JsonKey(name: 'hasSettings')
  bool hasSettings;

  @JsonKey(name: 'hasDiscovers')
  bool hasDiscovers;

  AccountUnread(this.relations,this.actions,this.orders,this.tasks,this.collections,this.hasSettings,this.hasDiscovers,);

  factory AccountUnread.fromJson(Map<String, dynamic> srcJson) => _$AccountUnreadFromJson(srcJson);

}