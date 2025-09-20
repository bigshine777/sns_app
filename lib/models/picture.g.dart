// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Picture _$PictureFromJson(Map<String, dynamic> json) => _Picture(
  id: (json['id'] as num).toInt(),
  albumId: (json['albumId'] as num).toInt(),
  title: json['title'] as String,
  url: json['url'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String,
  isLiked: json['isLiked'] as bool? ?? false,
);

Map<String, dynamic> _$PictureToJson(_Picture instance) => <String, dynamic>{
  'id': instance.id,
  'albumId': instance.albumId,
  'title': instance.title,
  'url': instance.url,
  'thumbnailUrl': instance.thumbnailUrl,
  'isLiked': instance.isLiked,
};
