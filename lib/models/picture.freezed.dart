// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Picture implements DiagnosticableTreeMixin {

 int get id; int get albumId; String get title; String get url; String get thumbnailUrl; bool get isLiked;
/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PictureCopyWith<Picture> get copyWith => _$PictureCopyWithImpl<Picture>(this as Picture, _$identity);

  /// Serializes this Picture to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Picture'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('albumId', albumId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl))..add(DiagnosticsProperty('isLiked', isLiked));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Picture&&(identical(other.id, id) || other.id == id)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,albumId,title,url,thumbnailUrl,isLiked);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Picture(id: $id, albumId: $albumId, title: $title, url: $url, thumbnailUrl: $thumbnailUrl, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $PictureCopyWith<$Res>  {
  factory $PictureCopyWith(Picture value, $Res Function(Picture) _then) = _$PictureCopyWithImpl;
@useResult
$Res call({
 int id, int albumId, String title, String url, String thumbnailUrl, bool isLiked
});




}
/// @nodoc
class _$PictureCopyWithImpl<$Res>
    implements $PictureCopyWith<$Res> {
  _$PictureCopyWithImpl(this._self, this._then);

  final Picture _self;
  final $Res Function(Picture) _then;

/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? albumId = null,Object? title = null,Object? url = null,Object? thumbnailUrl = null,Object? isLiked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Picture].
extension PicturePatterns on Picture {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Picture value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Picture() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Picture value)  $default,){
final _that = this;
switch (_that) {
case _Picture():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Picture value)?  $default,){
final _that = this;
switch (_that) {
case _Picture() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int albumId,  String title,  String url,  String thumbnailUrl,  bool isLiked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Picture() when $default != null:
return $default(_that.id,_that.albumId,_that.title,_that.url,_that.thumbnailUrl,_that.isLiked);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int albumId,  String title,  String url,  String thumbnailUrl,  bool isLiked)  $default,) {final _that = this;
switch (_that) {
case _Picture():
return $default(_that.id,_that.albumId,_that.title,_that.url,_that.thumbnailUrl,_that.isLiked);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int albumId,  String title,  String url,  String thumbnailUrl,  bool isLiked)?  $default,) {final _that = this;
switch (_that) {
case _Picture() when $default != null:
return $default(_that.id,_that.albumId,_that.title,_that.url,_that.thumbnailUrl,_that.isLiked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Picture with DiagnosticableTreeMixin implements Picture {
  const _Picture({required this.id, required this.albumId, required this.title, required this.url, required this.thumbnailUrl, this.isLiked = false});
  factory _Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

@override final  int id;
@override final  int albumId;
@override final  String title;
@override final  String url;
@override final  String thumbnailUrl;
@override@JsonKey() final  bool isLiked;

/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PictureCopyWith<_Picture> get copyWith => __$PictureCopyWithImpl<_Picture>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PictureToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Picture'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('albumId', albumId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl))..add(DiagnosticsProperty('isLiked', isLiked));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Picture&&(identical(other.id, id) || other.id == id)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,albumId,title,url,thumbnailUrl,isLiked);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Picture(id: $id, albumId: $albumId, title: $title, url: $url, thumbnailUrl: $thumbnailUrl, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class _$PictureCopyWith<$Res> implements $PictureCopyWith<$Res> {
  factory _$PictureCopyWith(_Picture value, $Res Function(_Picture) _then) = __$PictureCopyWithImpl;
@override @useResult
$Res call({
 int id, int albumId, String title, String url, String thumbnailUrl, bool isLiked
});




}
/// @nodoc
class __$PictureCopyWithImpl<$Res>
    implements _$PictureCopyWith<$Res> {
  __$PictureCopyWithImpl(this._self, this._then);

  final _Picture _self;
  final $Res Function(_Picture) _then;

/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? albumId = null,Object? title = null,Object? url = null,Object? thumbnailUrl = null,Object? isLiked = null,}) {
  return _then(_Picture(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
