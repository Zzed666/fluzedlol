// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return TestModel(
    json['accountNumber'] as String,
    json['accountName'] as String,
    json['accountHeadPortrait'] as String,
    json['accountAge'] as int,
    json['accountGender'] as String,
    json['accountLevel'] as int,
    json['accountPersonal'] == null
        ? null
        : AccountPersonal.fromJson(
            json['accountPersonal'] as Map<String, dynamic>),
    json['accountUnread'] == null
        ? null
        : AccountUnread.fromJson(json['accountUnread'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'accountHeadPortrait': instance.accountHeadPortrait,
      'accountAge': instance.accountAge,
      'accountGender': instance.accountGender,
      'accountLevel': instance.accountLevel,
      'accountPersonal': instance.accountPersonal,
      'accountUnread': instance.accountUnread,
    };

AccountPersonal _$AccountPersonalFromJson(Map<String, dynamic> json) {
  return AccountPersonal(
    json['attentions'] as int,
    json['fans'] as int,
    json['goodFriends'] as int,
    json['publishes'] as int,
  );
}

Map<String, dynamic> _$AccountPersonalToJson(AccountPersonal instance) =>
    <String, dynamic>{
      'attentions': instance.attentions,
      'fans': instance.fans,
      'goodFriends': instance.goodFriends,
      'publishes': instance.publishes,
    };

AccountUnread _$AccountUnreadFromJson(Map<String, dynamic> json) {
  return AccountUnread(
    json['relations'] as int,
    json['actions'] as int,
    json['orders'] as int,
    json['tasks'] as int,
    json['collections'] as int,
    json['hasSettings'] as bool,
    json['hasDiscovers'] as bool,
  );
}

Map<String, dynamic> _$AccountUnreadToJson(AccountUnread instance) =>
    <String, dynamic>{
      'relations': instance.relations,
      'actions': instance.actions,
      'orders': instance.orders,
      'tasks': instance.tasks,
      'collections': instance.collections,
      'hasSettings': instance.hasSettings,
      'hasDiscovers': instance.hasDiscovers,
    };
