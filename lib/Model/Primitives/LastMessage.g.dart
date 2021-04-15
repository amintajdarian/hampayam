// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LastMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) {
  return LastMessage(
    fn: json['fn'] as String,
    from: json['from'] as String,
    message: json['message'],
  );
}

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{
      'fn': instance.fn,
      'from': instance.from,
      'message': instance.message,
    };
