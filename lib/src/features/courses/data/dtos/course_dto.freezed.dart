// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseDto {
  String get id;
  String get title;
  String get description; // ignore: invalid_annotation_target
  @JsonKey(name: 'image_url')
  String get imageUrl;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseDtoCopyWith<CourseDto> get copyWith =>
      _$CourseDtoCopyWithImpl<CourseDto>(this as CourseDto, _$identity);

  /// Serializes this CourseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, imageUrl);

  @override
  String toString() {
    return 'CourseDto(id: $id, title: $title, description: $description, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $CourseDtoCopyWith<$Res> {
  factory $CourseDtoCopyWith(CourseDto value, $Res Function(CourseDto) _then) =
      _$CourseDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$CourseDtoCopyWithImpl<$Res> implements $CourseDtoCopyWith<$Res> {
  _$CourseDtoCopyWithImpl(this._self, this._then);

  final CourseDto _self;
  final $Res Function(CourseDto) _then;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CourseDto].
extension CourseDtoPatterns on CourseDto {
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
    TResult Function(_CourseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseDto() when $default != null:
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
    TResult Function(_CourseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDto():
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
    TResult? Function(_CourseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDto() when $default != null:
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
    TResult Function(String id, String title, String description,
            @JsonKey(name: 'image_url') String imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseDto() when $default != null:
        return $default(
            _that.id, _that.title, _that.description, _that.imageUrl);
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
    TResult Function(String id, String title, String description,
            @JsonKey(name: 'image_url') String imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDto():
        return $default(
            _that.id, _that.title, _that.description, _that.imageUrl);
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
    TResult? Function(String id, String title, String description,
            @JsonKey(name: 'image_url') String imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDto() when $default != null:
        return $default(
            _that.id, _that.title, _that.description, _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CourseDto extends CourseDto {
  const _CourseDto(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'image_url') required this.imageUrl})
      : super._();
  factory _CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseDtoCopyWith<_CourseDto> get copyWith =>
      __$CourseDtoCopyWithImpl<_CourseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, imageUrl);

  @override
  String toString() {
    return 'CourseDto(id: $id, title: $title, description: $description, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$CourseDtoCopyWith<$Res>
    implements $CourseDtoCopyWith<$Res> {
  factory _$CourseDtoCopyWith(
          _CourseDto value, $Res Function(_CourseDto) _then) =
      __$CourseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$CourseDtoCopyWithImpl<$Res> implements _$CourseDtoCopyWith<$Res> {
  __$CourseDtoCopyWithImpl(this._self, this._then);

  final _CourseDto _self;
  final $Res Function(_CourseDto) _then;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
  }) {
    return _then(_CourseDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
