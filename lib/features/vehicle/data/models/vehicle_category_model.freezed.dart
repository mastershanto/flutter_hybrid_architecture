// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleCategoryModel _$VehicleCategoryModelFromJson(Map<String, dynamic> json) {
  return _VehicleCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this VehicleCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCategoryModelCopyWith<VehicleCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCategoryModelCopyWith<$Res> {
  factory $VehicleCategoryModelCopyWith(
    VehicleCategoryModel value,
    $Res Function(VehicleCategoryModel) then,
  ) = _$VehicleCategoryModelCopyWithImpl<$Res, VehicleCategoryModel>;
  @useResult
  $Res call({int id, String name, String? description, String? imageUrl});
}

/// @nodoc
class _$VehicleCategoryModelCopyWithImpl<
  $Res,
  $Val extends VehicleCategoryModel
>
    implements $VehicleCategoryModelCopyWith<$Res> {
  _$VehicleCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleCategoryModel
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
abstract class _$$VehicleCategoryModelImplCopyWith<$Res>
    implements $VehicleCategoryModelCopyWith<$Res> {
  factory _$$VehicleCategoryModelImplCopyWith(
    _$VehicleCategoryModelImpl value,
    $Res Function(_$VehicleCategoryModelImpl) then,
  ) = __$$VehicleCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description, String? imageUrl});
}

/// @nodoc
class __$$VehicleCategoryModelImplCopyWithImpl<$Res>
    extends _$VehicleCategoryModelCopyWithImpl<$Res, _$VehicleCategoryModelImpl>
    implements _$$VehicleCategoryModelImplCopyWith<$Res> {
  __$$VehicleCategoryModelImplCopyWithImpl(
    _$VehicleCategoryModelImpl _value,
    $Res Function(_$VehicleCategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleCategoryModel
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
      _$VehicleCategoryModelImpl(
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
class _$VehicleCategoryModelImpl implements _VehicleCategoryModel {
  const _$VehicleCategoryModelImpl({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
  });

  factory _$VehicleCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleCategoryModelImplFromJson(json);

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
    return 'VehicleCategoryModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleCategoryModelImpl &&
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

  /// Create a copy of VehicleCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleCategoryModelImplCopyWith<_$VehicleCategoryModelImpl>
  get copyWith =>
      __$$VehicleCategoryModelImplCopyWithImpl<_$VehicleCategoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleCategoryModelImplToJson(this);
  }
}

abstract class _VehicleCategoryModel implements VehicleCategoryModel {
  const factory _VehicleCategoryModel({
    required final int id,
    required final String name,
    final String? description,
    final String? imageUrl,
  }) = _$VehicleCategoryModelImpl;

  factory _VehicleCategoryModel.fromJson(Map<String, dynamic> json) =
      _$VehicleCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get imageUrl;

  /// Create a copy of VehicleCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleCategoryModelImplCopyWith<_$VehicleCategoryModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
