import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class NewsModel {
  @JsonKey(name: 'author')
  final String? author;

  @JsonKey(name: 'content')
  final String? content;

  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @JsonKey(name: 'readMoreUrl')
  final String? readMoreUrl;

  @JsonKey(name: 'time')
  final String? time;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'url')
  final String? url;

  NewsModel({this.content, this.date, this.imageUrl, this.title, this.author, this.readMoreUrl, this.time, this.url});


  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);


}