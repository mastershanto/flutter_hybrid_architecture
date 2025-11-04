// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_submodel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleSubModelModel _$VehicleSubModelModelFromJson(Map<String, dynamic> json) {
  return _VehicleSubModelModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleSubModelModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get modelId => throw _privateConstructorUsedError;

  /// Serializes this VehicleSubModelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleSubModelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleSubModelModelCopyWith<VehicleSubModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleSubModelModelCopyWith<$Res> {
  factory $VehicleSubModelModelCopyWith(
    VehicleSubModelModel value,
    $Res Function(VehicleSubModelModel) then,
  ) = _$VehicleSubModelModelCopyWithImpl<$Res, VehicleSubModelModel>;
  @useResult
  $Res call({int id, String name, int? modelId});
}

/// @nodoc
class _$VehicleSubModelModelCopyWithImpl<
  $Res,
  $Val extends VehicleSubModelModel
>
    implements $VehicleSubModelModelCopyWith<$Res> {
  _$VehicleSubModelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleSubModelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? modelId = freezed,
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
            modelId: freezed == modelId
                ? _value.modelId
                : modelId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleSubModelModelImplCopyWith<$Res>
    implements $VehicleSubModelModelCopyWith<$Res> {
  factory _$$VehicleSubModelModelImplCopyWith(
    _$VehicleSubModelModelImpl value,
    $Res Function(_$VehicleSubModelModelImpl) then,
  ) = __$$VehicleSubModelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int? modelId});
}

/// @nodoc
class __$$VehicleSubModelModelImplCopyWithImpl<$Res>
    extends _$VehicleSubModelModelCopyWithImpl<$Res, _$VehicleSubModelModelImpl>
    implements _$$VehicleSubModelModelImplCopyWith<$Res> {
  __$$VehicleSubModelModelImplCopyWithImpl(
    _$VehicleSubModelModelImpl _value,
    $Res Function(_$VehicleSubModelModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleSubModelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? modelId = freezed,
  }) {
    return _then(
      _$VehicleSubModelModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        modelId: freezed == modelId
            ? _value.modelId
            : modelId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleSubModelModelImpl extends _VehicleSubModelModel {
  const _$VehicleSubModelModelImpl({
    required this.id,
    required this.name,
    this.modelId,
  }) : super._();

  factory _$VehicleSubModelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleSubModelModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? modelId;

  @override
  String toString() {
    return 'VehicleSubModelModel(id: $id, name: $name, modelId: $modelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleSubModelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.modelId, modelId) || other.modelId == modelId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, modelId);

  /// Create a copy of VehicleSubModelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleSubModelModelImplCopyWith<_$VehicleSubModelModelImpl>
  get copyWith =>
      __$$VehicleSubModelModelImplCopyWithImpl<_$VehicleSubModelModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleSubModelModelImplToJson(this);
  }
}

abstract class _VehicleSubModelModel extends VehicleSubModelModel {
  const factory _VehicleSubModelModel({
    required final int id,
    required final String name,
    final int? modelId,
  }) = _$VehicleSubModelModelImpl;
  const _VehicleSubModelModel._() : super._();

  factory _VehicleSubModelModel.fromJson(Map<String, dynamic> json) =
      _$VehicleSubModelModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get modelId;

  /// Create a copy of VehicleSubModelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleSubModelModelImplCopyWith<_$VehicleSubModelModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
