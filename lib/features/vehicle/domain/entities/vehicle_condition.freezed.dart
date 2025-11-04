// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleCondition _$VehicleConditionFromJson(Map<String, dynamic> json) {
  return _VehicleCondition.fromJson(json);
}

/// @nodoc
mixin _$VehicleCondition {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this VehicleCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleConditionCopyWith<VehicleCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleConditionCopyWith<$Res> {
  factory $VehicleConditionCopyWith(
    VehicleCondition value,
    $Res Function(VehicleCondition) then,
  ) = _$VehicleConditionCopyWithImpl<$Res, VehicleCondition>;
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class _$VehicleConditionCopyWithImpl<$Res, $Val extends VehicleCondition>
    implements $VehicleConditionCopyWith<$Res> {
  _$VehicleConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleConditionImplCopyWith<$Res>
    implements $VehicleConditionCopyWith<$Res> {
  factory _$$VehicleConditionImplCopyWith(
    _$VehicleConditionImpl value,
    $Res Function(_$VehicleConditionImpl) then,
  ) = __$$VehicleConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class __$$VehicleConditionImplCopyWithImpl<$Res>
    extends _$VehicleConditionCopyWithImpl<$Res, _$VehicleConditionImpl>
    implements _$$VehicleConditionImplCopyWith<$Res> {
  __$$VehicleConditionImplCopyWithImpl(
    _$VehicleConditionImpl _value,
    $Res Function(_$VehicleConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(
      _$VehicleConditionImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleConditionImpl implements _VehicleCondition {
  const _$VehicleConditionImpl({
    required this.id,
    required this.name,
    this.description,
  });

  factory _$VehicleConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleConditionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'VehicleCondition(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleConditionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of VehicleCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleConditionImplCopyWith<_$VehicleConditionImpl> get copyWith =>
      __$$VehicleConditionImplCopyWithImpl<_$VehicleConditionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleConditionImplToJson(this);
  }
}

abstract class _VehicleCondition implements VehicleCondition {
  const factory _VehicleCondition({
    required final int id,
    required final String name,
    final String? description,
  }) = _$VehicleConditionImpl;

  factory _VehicleCondition.fromJson(Map<String, dynamic> json) =
      _$VehicleConditionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of VehicleCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleConditionImplCopyWith<_$VehicleConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
