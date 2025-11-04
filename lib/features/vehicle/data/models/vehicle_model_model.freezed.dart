// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleModelModel _$VehicleModelModelFromJson(Map<String, dynamic> json) {
  return _VehicleModelModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModelModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get brandId => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this VehicleModelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleModelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleModelModelCopyWith<VehicleModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelModelCopyWith<$Res> {
  factory $VehicleModelModelCopyWith(
    VehicleModelModel value,
    $Res Function(VehicleModelModel) then,
  ) = _$VehicleModelModelCopyWithImpl<$Res, VehicleModelModel>;
  @useResult
  $Res call({int id, String name, int? brandId, int? categoryId});
}

/// @nodoc
class _$VehicleModelModelCopyWithImpl<$Res, $Val extends VehicleModelModel>
    implements $VehicleModelModelCopyWith<$Res> {
  _$VehicleModelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brandId = freezed,
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
            brandId: freezed == brandId
                ? _value.brandId
                : brandId // ignore: cast_nullable_to_non_nullable
                      as int?,
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
abstract class _$$VehicleModelModelImplCopyWith<$Res>
    implements $VehicleModelModelCopyWith<$Res> {
  factory _$$VehicleModelModelImplCopyWith(
    _$VehicleModelModelImpl value,
    $Res Function(_$VehicleModelModelImpl) then,
  ) = __$$VehicleModelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int? brandId, int? categoryId});
}

/// @nodoc
class __$$VehicleModelModelImplCopyWithImpl<$Res>
    extends _$VehicleModelModelCopyWithImpl<$Res, _$VehicleModelModelImpl>
    implements _$$VehicleModelModelImplCopyWith<$Res> {
  __$$VehicleModelModelImplCopyWithImpl(
    _$VehicleModelModelImpl _value,
    $Res Function(_$VehicleModelModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleModelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brandId = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(
      _$VehicleModelModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        brandId: freezed == brandId
            ? _value.brandId
            : brandId // ignore: cast_nullable_to_non_nullable
                  as int?,
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
class _$VehicleModelModelImpl extends _VehicleModelModel {
  const _$VehicleModelModelImpl({
    required this.id,
    required this.name,
    this.brandId,
    this.categoryId,
  }) : super._();

  factory _$VehicleModelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? brandId;
  @override
  final int? categoryId;

  @override
  String toString() {
    return 'VehicleModelModel(id: $id, name: $name, brandId: $brandId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, brandId, categoryId);

  /// Create a copy of VehicleModelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleModelModelImplCopyWith<_$VehicleModelModelImpl> get copyWith =>
      __$$VehicleModelModelImplCopyWithImpl<_$VehicleModelModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleModelModelImplToJson(this);
  }
}

abstract class _VehicleModelModel extends VehicleModelModel {
  const factory _VehicleModelModel({
    required final int id,
    required final String name,
    final int? brandId,
    final int? categoryId,
  }) = _$VehicleModelModelImpl;
  const _VehicleModelModel._() : super._();

  factory _VehicleModelModel.fromJson(Map<String, dynamic> json) =
      _$VehicleModelModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get brandId;
  @override
  int? get categoryId;

  /// Create a copy of VehicleModelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleModelModelImplCopyWith<_$VehicleModelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
