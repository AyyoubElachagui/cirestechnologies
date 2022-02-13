// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map json) {
  return NewsModel(
    content: json['content'] as String?,
    date: json['date'] as String?,
    imageUrl: json['imageUrl'] as String?,
    title: json['title'] as String?,
    author: json['author'] as String?,
    readMoreUrl: json['readMoreUrl'] as String?,
    time: json['time'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'date': instance.date,
      'imageUrl': instance.imageUrl,
      'readMoreUrl': instance.readMoreUrl,
      'time': instance.time,
      'title': instance.title,
      'url': instance.url,
    };
