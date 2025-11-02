// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleCategory _$VehicleCategoryFromJson(Map<String, dynamic> json) {
  return _VehicleCategory.fromJson(json);
}

/// @nodoc
mixin _$VehicleCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this VehicleCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCategoryCopyWith<VehicleCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCategoryCopyWith<$Res> {
  factory $VehicleCategoryCopyWith(
    VehicleCategory value,
    $Res Function(VehicleCategory) then,
  ) = _$VehicleCategoryCopyWithImpl<$Res, VehicleCategory>;
  @useResult
  $Res call({int id, String name, String? description, String? imageUrl});
}

/// @nodoc
class _$VehicleCategoryCopyWithImpl<$Res, $Val extends VehicleCategory>
    implements $VehicleCategoryCopyWith<$Res> {
  _$VehicleCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleCategoryImplCopyWith<$Res>
    implements $VehicleCategoryCopyWith<$Res> {
  factory _$$VehicleCategoryImplCopyWith(
    _$VehicleCategoryImpl value,
    $Res Function(_$VehicleCategoryImpl) then,
  ) = __$$VehicleCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description, String? imageUrl});
}

/// @nodoc
class __$$VehicleCategoryImplCopyWithImpl<$Res>
    extends _$VehicleCategoryCopyWithImpl<$Res, _$VehicleCategoryImpl>
    implements _$$VehicleCategoryImplCopyWith<$Res> {
  __$$VehicleCategoryImplCopyWithImpl(
    _$VehicleCategoryImpl _value,
    $Res Function(_$VehicleCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$VehicleCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleCategoryImpl implements _VehicleCategory {
  const _$VehicleCategoryImpl({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
  });

  factory _$VehicleCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'VehicleCategory(id: $id, name: $name, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imageUrl);

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleCategoryImplCopyWith<_$VehicleCategoryImpl> get copyWith =>
      __$$VehicleCategoryImplCopyWithImpl<_$VehicleCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleCategoryImplToJson(this);
  }
}

abstract class _VehicleCategory implements VehicleCategory {
  const factory _VehicleCategory({
    required final int id,
    required final String name,
    final String? description,
    final String? imageUrl,
  }) = _$VehicleCategoryImpl;

  factory _VehicleCategory.fromJson(Map<String, dynamic> json) =
      _$VehicleCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get imageUrl;

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleCategoryImplCopyWith<_$VehicleCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
