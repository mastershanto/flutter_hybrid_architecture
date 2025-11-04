// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_brand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleBrandModel _$VehicleBrandModelFromJson(Map<String, dynamic> json) {
  return _VehicleBrandModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleBrandModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this VehicleBrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleBrandModelCopyWith<VehicleBrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleBrandModelCopyWith<$Res> {
  factory $VehicleBrandModelCopyWith(
    VehicleBrandModel value,
    $Res Function(VehicleBrandModel) then,
  ) = _$VehicleBrandModelCopyWithImpl<$Res, VehicleBrandModel>;
  @useResult
  $Res call({int id, String name, String? logoUrl, int? categoryId});
}

/// @nodoc
class _$VehicleBrandModelCopyWithImpl<$Res, $Val extends VehicleBrandModel>
    implements $VehicleBrandModelCopyWith<$Res> {
  _$VehicleBrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
    Object? categoryId = freezed,
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
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleBrandModelImplCopyWith<$Res>
    implements $VehicleBrandModelCopyWith<$Res> {
  factory _$$VehicleBrandModelImplCopyWith(
    _$VehicleBrandModelImpl value,
    $Res Function(_$VehicleBrandModelImpl) then,
  ) = __$$VehicleBrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? logoUrl, int? categoryId});
}

/// @nodoc
class __$$VehicleBrandModelImplCopyWithImpl<$Res>
    extends _$VehicleBrandModelCopyWithImpl<$Res, _$VehicleBrandModelImpl>
    implements _$$VehicleBrandModelImplCopyWith<$Res> {
  __$$VehicleBrandModelImplCopyWithImpl(
    _$VehicleBrandModelImpl _value,
    $Res Function(_$VehicleBrandModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(
      _$VehicleBrandModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleBrandModelImpl extends _VehicleBrandModel {
  const _$VehicleBrandModelImpl({
    required this.id,
    required this.name,
    this.logoUrl,
    this.categoryId,
  }) : super._();

  factory _$VehicleBrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleBrandModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logoUrl;
  @override
  final int? categoryId;

  @override
  String toString() {
    return 'VehicleBrandModel(id: $id, name: $name, logoUrl: $logoUrl, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleBrandModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logoUrl, categoryId);

  /// Create a copy of VehicleBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleBrandModelImplCopyWith<_$VehicleBrandModelImpl> get copyWith =>
      __$$VehicleBrandModelImplCopyWithImpl<_$VehicleBrandModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleBrandModelImplToJson(this);
  }
}

abstract class _VehicleBrandModel extends VehicleBrandModel {
  const factory _VehicleBrandModel({
    required final int id,
    required final String name,
    final String? logoUrl,
    final int? categoryId,
  }) = _$VehicleBrandModelImpl;
  const _VehicleBrandModel._() : super._();

  factory _VehicleBrandModel.fromJson(Map<String, dynamic> json) =
      _$VehicleBrandModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logoUrl;
  @override
  int? get categoryId;

  /// Create a copy of VehicleBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleBrandModelImplCopyWith<_$VehicleBrandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
