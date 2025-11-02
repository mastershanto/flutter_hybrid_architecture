// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_color_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleColorModel _$VehicleColorModelFromJson(Map<String, dynamic> json) {
  return _VehicleColorModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleColorModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get hexCode => throw _privateConstructorUsedError;

  /// Serializes this VehicleColorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleColorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleColorModelCopyWith<VehicleColorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleColorModelCopyWith<$Res> {
  factory $VehicleColorModelCopyWith(
    VehicleColorModel value,
    $Res Function(VehicleColorModel) then,
  ) = _$VehicleColorModelCopyWithImpl<$Res, VehicleColorModel>;
  @useResult
  $Res call({int id, String name, String? hexCode});
}

/// @nodoc
class _$VehicleColorModelCopyWithImpl<$Res, $Val extends VehicleColorModel>
    implements $VehicleColorModelCopyWith<$Res> {
  _$VehicleColorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleColorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hexCode = freezed,
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
            hexCode: freezed == hexCode
                ? _value.hexCode
                : hexCode // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleColorModelImplCopyWith<$Res>
    implements $VehicleColorModelCopyWith<$Res> {
  factory _$$VehicleColorModelImplCopyWith(
    _$VehicleColorModelImpl value,
    $Res Function(_$VehicleColorModelImpl) then,
  ) = __$$VehicleColorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? hexCode});
}

/// @nodoc
class __$$VehicleColorModelImplCopyWithImpl<$Res>
    extends _$VehicleColorModelCopyWithImpl<$Res, _$VehicleColorModelImpl>
    implements _$$VehicleColorModelImplCopyWith<$Res> {
  __$$VehicleColorModelImplCopyWithImpl(
    _$VehicleColorModelImpl _value,
    $Res Function(_$VehicleColorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleColorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hexCode = freezed,
  }) {
    return _then(
      _$VehicleColorModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        hexCode: freezed == hexCode
            ? _value.hexCode
            : hexCode // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleColorModelImpl implements _VehicleColorModel {
  const _$VehicleColorModelImpl({
    required this.id,
    required this.name,
    this.hexCode,
  });

  factory _$VehicleColorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleColorModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? hexCode;

  @override
  String toString() {
    return 'VehicleColorModel(id: $id, name: $name, hexCode: $hexCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleColorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hexCode, hexCode) || other.hexCode == hexCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, hexCode);

  /// Create a copy of VehicleColorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleColorModelImplCopyWith<_$VehicleColorModelImpl> get copyWith =>
      __$$VehicleColorModelImplCopyWithImpl<_$VehicleColorModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleColorModelImplToJson(this);
  }
}

abstract class _VehicleColorModel implements VehicleColorModel {
  const factory _VehicleColorModel({
    required final int id,
    required final String name,
    final String? hexCode,
  }) = _$VehicleColorModelImpl;

  factory _VehicleColorModel.fromJson(Map<String, dynamic> json) =
      _$VehicleColorModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get hexCode;

  /// Create a copy of VehicleColorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleColorModelImplCopyWith<_$VehicleColorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
