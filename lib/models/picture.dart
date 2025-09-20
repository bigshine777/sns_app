import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';
part 'picture.g.dart';

@freezed
abstract class Picture with _$Picture {
  const factory Picture({
    required int id,
    required int albumId,
    required String title,
    required String url,
    required String thumbnailUrl,
    @Default(false) bool isLiked,
  }) = _Picture;

  factory Picture.fromJson(Map<String, Object?> json) =>
      _$PictureFromJson(json);
}
