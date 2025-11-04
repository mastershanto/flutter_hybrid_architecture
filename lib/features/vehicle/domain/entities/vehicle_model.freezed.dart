// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return _VehicleModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get brandId => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleModelCopyWith<VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelCopyWith<$Res> {
  factory $VehicleModelCopyWith(
    VehicleModel value,
    $Res Function(VehicleModel) then,
  ) = _$VehicleModelCopyWithImpl<$Res, VehicleModel>;
  @useResult
  $Res call({int id, String name, int? brandId, int? categoryId});
}

/// @nodoc
class _$VehicleModelCopyWithImpl<$Res, $Val extends VehicleModel>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModel
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
abstract class _$$VehicleModelImplCopyWith<$Res>
    implements $VehicleModelCopyWith<$Res> {
  factory _$$VehicleModelImplCopyWith(
    _$VehicleModelImpl value,
    $Res Function(_$VehicleModelImpl) then,
  ) = __$$VehicleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int? brandId, int? categoryId});
}

/// @nodoc
class __$$VehicleModelImplCopyWithImpl<$Res>
    extends _$VehicleModelCopyWithImpl<$Res, _$VehicleModelImpl>
    implements _$$VehicleModelImplCopyWith<$Res> {
  __$$VehicleModelImplCopyWithImpl(
    _$VehicleModelImpl _value,
    $Res Function(_$VehicleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleModel
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
      _$VehicleModelImpl(
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
class _$VehicleModelImpl implements _VehicleModel {
  const _$VehicleModelImpl({
    required this.id,
    required this.name,
    this.brandId,
    this.categoryId,
  });

  factory _$VehicleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelImplFromJson(json);

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
    return 'VehicleModel(id: $id, name: $name, brandId: $brandId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, brandId, categoryId);

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      __$$VehicleModelImplCopyWithImpl<_$VehicleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleModelImplToJson(this);
  }
}

abstract class _VehicleModel implements VehicleModel {
  const factory _VehicleModel({
    required final int id,
    required final String name,
    final int? brandId,
    final int? categoryId,
  }) = _$VehicleModelImpl;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$VehicleModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get brandId;
  @override
  int? get categoryId;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
