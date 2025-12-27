// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoEntity {
  String get id;
  String get title;
  String get thumbnailUrl;
  String get duration;

  /// Create a copy of VideoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoEntityCopyWith<VideoEntity> get copyWith =>
      _$VideoEntityCopyWithImpl<VideoEntity>(this as VideoEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, thumbnailUrl, duration);

  @override
  String toString() {
    return 'VideoEntity(id: $id, title: $title, thumbnailUrl: $thumbnailUrl, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $VideoEntityCopyWith<$Res> {
  factory $VideoEntityCopyWith(
          VideoEntity value, $Res Function(VideoEntity) _then) =
      _$VideoEntityCopyWithImpl;
  @useResult
  $Res call({String id, String title, String thumbnailUrl, String duration});
}

/// @nodoc
class _$VideoEntityCopyWithImpl<$Res> implements $VideoEntityCopyWith<$Res> {
  _$VideoEntityCopyWithImpl(this._self, this._then);

  final VideoEntity _self;
  final $Res Function(VideoEntity) _then;

  /// Create a copy of VideoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnailUrl = null,
    Object? duration = null,
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
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [VideoEntity].
extension VideoEntityPatterns on VideoEntity {
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
    TResult Function(_VideoEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoEntity() when $default != null:
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
    TResult Function(_VideoEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoEntity():
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
    TResult? Function(_VideoEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoEntity() when $default != null:
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
    TResult Function(
            String id, String title, String thumbnailUrl, String duration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoEntity() when $default != null:
        return $default(
            _that.id, _that.title, _that.thumbnailUrl, _that.duration);
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
    TResult Function(
            String id, String title, String thumbnailUrl, String duration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoEntity():
        return $default(
            _that.id, _that.title, _that.thumbnailUrl, _that.duration);
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
    TResult? Function(
            String id, String title, String thumbnailUrl, String duration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoEntity() when $default != null:
        return $default(
            _that.id, _that.title, _that.thumbnailUrl, _that.duration);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoEntity implements VideoEntity {
  const _VideoEntity(
      {required this.id,
      required this.title,
      required this.thumbnailUrl,
      required this.duration});

  @override
  final String id;
  @override
  final String title;
  @override
  final String thumbnailUrl;
  @override
  final String duration;

  /// Create a copy of VideoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoEntityCopyWith<_VideoEntity> get copyWith =>
      __$VideoEntityCopyWithImpl<_VideoEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, thumbnailUrl, duration);

  @override
  String toString() {
    return 'VideoEntity(id: $id, title: $title, thumbnailUrl: $thumbnailUrl, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$VideoEntityCopyWith<$Res>
    implements $VideoEntityCopyWith<$Res> {
  factory _$VideoEntityCopyWith(
          _VideoEntity value, $Res Function(_VideoEntity) _then) =
      __$VideoEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title, String thumbnailUrl, String duration});
}

/// @nodoc
class __$VideoEntityCopyWithImpl<$Res> implements _$VideoEntityCopyWith<$Res> {
  __$VideoEntityCopyWithImpl(this._self, this._then);

  final _VideoEntity _self;
  final $Res Function(_VideoEntity) _then;

  /// Create a copy of VideoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnailUrl = null,
    Object? duration = null,
  }) {
    return _then(_VideoEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
