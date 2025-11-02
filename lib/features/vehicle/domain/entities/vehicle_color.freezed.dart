// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleColor _$VehicleColorFromJson(Map<String, dynamic> json) {
  return _VehicleColor.fromJson(json);
}

/// @nodoc
mixin _$VehicleColor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get hexCode => throw _privateConstructorUsedError;

  /// Serializes this VehicleColor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleColorCopyWith<VehicleColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleColorCopyWith<$Res> {
  factory $VehicleColorCopyWith(
    VehicleColor value,
    $Res Function(VehicleColor) then,
  ) = _$VehicleColorCopyWithImpl<$Res, VehicleColor>;
  @useResult
  $Res call({int id, String name, String? hexCode});
}

/// @nodoc
class _$VehicleColorCopyWithImpl<$Res, $Val extends VehicleColor>
    implements $VehicleColorCopyWith<$Res> {
  _$VehicleColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleColor
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
abstract class _$$VehicleColorImplCopyWith<$Res>
    implements $VehicleColorCopyWith<$Res> {
  factory _$$VehicleColorImplCopyWith(
    _$VehicleColorImpl value,
    $Res Function(_$VehicleColorImpl) then,
  ) = __$$VehicleColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? hexCode});
}

/// @nodoc
class __$$VehicleColorImplCopyWithImpl<$Res>
    extends _$VehicleColorCopyWithImpl<$Res, _$VehicleColorImpl>
    implements _$$VehicleColorImplCopyWith<$Res> {
  __$$VehicleColorImplCopyWithImpl(
    _$VehicleColorImpl _value,
    $Res Function(_$VehicleColorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hexCode = freezed,
  }) {
    return _then(
      _$VehicleColorImpl(
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
class _$VehicleColorImpl implements _VehicleColor {
  const _$VehicleColorImpl({
    required this.id,
    required this.name,
    this.hexCode,
  });

  factory _$VehicleColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleColorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? hexCode;

  @override
  String toString() {
    return 'VehicleColor(id: $id, name: $name, hexCode: $hexCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleColorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hexCode, hexCode) || other.hexCode == hexCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, hexCode);

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleColorImplCopyWith<_$VehicleColorImpl> get copyWith =>
      __$$VehicleColorImplCopyWithImpl<_$VehicleColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleColorImplToJson(this);
  }
}

abstract class _VehicleColor implements VehicleColor {
  const factory _VehicleColor({
    required final int id,
    required final String name,
    final String? hexCode,
  }) = _$VehicleColorImpl;

  factory _VehicleColor.fromJson(Map<String, dynamic> json) =
      _$VehicleColorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get hexCode;

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleColorImplCopyWith<_$VehicleColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
