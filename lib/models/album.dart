import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
abstract class Album with _$Album {
  const factory Album({
    required int id,
    required int userId,
    required String title,
    @Default(false) bool isLiked,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);
}
