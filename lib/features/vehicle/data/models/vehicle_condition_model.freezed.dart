// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_condition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleConditionModel _$VehicleConditionModelFromJson(
  Map<String, dynamic> json,
) {
  return _VehicleConditionModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleConditionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this VehicleConditionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleConditionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleConditionModelCopyWith<VehicleConditionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleConditionModelCopyWith<$Res> {
  factory $VehicleConditionModelCopyWith(
    VehicleConditionModel value,
    $Res Function(VehicleConditionModel) then,
  ) = _$VehicleConditionModelCopyWithImpl<$Res, VehicleConditionModel>;
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class _$VehicleConditionModelCopyWithImpl<
  $Res,
  $Val extends VehicleConditionModel
>
    implements $VehicleConditionModelCopyWith<$Res> {
  _$VehicleConditionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleConditionModel
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
abstract class _$$VehicleConditionModelImplCopyWith<$Res>
    implements $VehicleConditionModelCopyWith<$Res> {
  factory _$$VehicleConditionModelImplCopyWith(
    _$VehicleConditionModelImpl value,
    $Res Function(_$VehicleConditionModelImpl) then,
  ) = __$$VehicleConditionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class __$$VehicleConditionModelImplCopyWithImpl<$Res>
    extends
        _$VehicleConditionModelCopyWithImpl<$Res, _$VehicleConditionModelImpl>
    implements _$$VehicleConditionModelImplCopyWith<$Res> {
  __$$VehicleConditionModelImplCopyWithImpl(
    _$VehicleConditionModelImpl _value,
    $Res Function(_$VehicleConditionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleConditionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(
      _$VehicleConditionModelImpl(
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
class _$VehicleConditionModelImpl implements _VehicleConditionModel {
  const _$VehicleConditionModelImpl({
    required this.id,
    required this.name,
    this.description,
  });

  factory _$VehicleConditionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleConditionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'VehicleConditionModel(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleConditionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of VehicleConditionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleConditionModelImplCopyWith<_$VehicleConditionModelImpl>
  get copyWith =>
      __$$VehicleConditionModelImplCopyWithImpl<_$VehicleConditionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleConditionModelImplToJson(this);
  }
}

abstract class _VehicleConditionModel implements VehicleConditionModel {
  const factory _VehicleConditionModel({
    required final int id,
    required final String name,
    final String? description,
  }) = _$VehicleConditionModelImpl;

  factory _VehicleConditionModel.fromJson(Map<String, dynamic> json) =
      _$VehicleConditionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of VehicleConditionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleConditionModelImplCopyWith<_$VehicleConditionModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
