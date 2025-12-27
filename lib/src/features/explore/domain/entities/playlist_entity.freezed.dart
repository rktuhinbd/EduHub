// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistEntity {
  String get id;
  String get title;
  List<VideoEntity> get videos;

  /// Create a copy of PlaylistEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistEntityCopyWith<PlaylistEntity> get copyWith =>
      _$PlaylistEntityCopyWithImpl<PlaylistEntity>(
          this as PlaylistEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.videos, videos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(videos));

  @override
  String toString() {
    return 'PlaylistEntity(id: $id, title: $title, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class $PlaylistEntityCopyWith<$Res> {
  factory $PlaylistEntityCopyWith(
          PlaylistEntity value, $Res Function(PlaylistEntity) _then) =
      _$PlaylistEntityCopyWithImpl;
  @useResult
  $Res call({String id, String title, List<VideoEntity> videos});
}

/// @nodoc
class _$PlaylistEntityCopyWithImpl<$Res>
    implements $PlaylistEntityCopyWith<$Res> {
  _$PlaylistEntityCopyWithImpl(this._self, this._then);

  final PlaylistEntity _self;
  final $Res Function(PlaylistEntity) _then;

  /// Create a copy of PlaylistEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? videos = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      videos: null == videos
          ? _self.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaylistEntity].
extension PlaylistEntityPatterns on PlaylistEntity {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlaylistEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistEntity() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PlaylistEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistEntity():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PlaylistEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistEntity() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, List<VideoEntity> videos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistEntity() when $default != null:
        return $default(_that.id, _that.title, _that.videos);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, List<VideoEntity> videos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistEntity():
        return $default(_that.id, _that.title, _that.videos);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String title, List<VideoEntity> videos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistEntity() when $default != null:
        return $default(_that.id, _that.title, _that.videos);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaylistEntity implements PlaylistEntity {
  const _PlaylistEntity(
      {required this.id,
      required this.title,
      required final List<VideoEntity> videos})
      : _videos = videos;

  @override
  final String id;
  @override
  final String title;
  final List<VideoEntity> _videos;
  @override
  List<VideoEntity> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  /// Create a copy of PlaylistEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistEntityCopyWith<_PlaylistEntity> get copyWith =>
      __$PlaylistEntityCopyWithImpl<_PlaylistEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaylistEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_videos));

  @override
  String toString() {
    return 'PlaylistEntity(id: $id, title: $title, videos: $videos)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistEntityCopyWith<$Res>
    implements $PlaylistEntityCopyWith<$Res> {
  factory _$PlaylistEntityCopyWith(
          _PlaylistEntity value, $Res Function(_PlaylistEntity) _then) =
      __$PlaylistEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title, List<VideoEntity> videos});
}

/// @nodoc
class __$PlaylistEntityCopyWithImpl<$Res>
    implements _$PlaylistEntityCopyWith<$Res> {
  __$PlaylistEntityCopyWithImpl(this._self, this._then);

  final _PlaylistEntity _self;
  final $Res Function(_PlaylistEntity) _then;

  /// Create a copy of PlaylistEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? videos = null,
  }) {
    return _then(_PlaylistEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      videos: null == videos
          ? _self._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoEntity>,
    ));
  }
}

// dart format on
