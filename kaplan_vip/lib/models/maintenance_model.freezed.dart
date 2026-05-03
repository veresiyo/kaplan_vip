// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MaintenanceModel _$MaintenanceModelFromJson(Map<String, dynamic> json) {
  return _MaintenanceModel.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceModel {
  String get id => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get maintenanceType =>
      throw _privateConstructorUsedError; // "oil" | "tire" | "inspection" | "repair" | "other"
  int get kmAtMaintenance => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceModelCopyWith<MaintenanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceModelCopyWith<$Res> {
  factory $MaintenanceModelCopyWith(
    MaintenanceModel value,
    $Res Function(MaintenanceModel) then,
  ) = _$MaintenanceModelCopyWithImpl<$Res, MaintenanceModel>;
  @useResult
  $Res call({
    String id,
    String vehicleId,
    DateTime date,
    String maintenanceType,
    int kmAtMaintenance,
    String notes,
    double? cost,
    DateTime createdAt,
  });
}

/// @nodoc
class _$MaintenanceModelCopyWithImpl<$Res, $Val extends MaintenanceModel>
    implements $MaintenanceModelCopyWith<$Res> {
  _$MaintenanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? date = null,
    Object? maintenanceType = null,
    Object? kmAtMaintenance = null,
    Object? notes = null,
    Object? cost = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            maintenanceType: null == maintenanceType
                ? _value.maintenanceType
                : maintenanceType // ignore: cast_nullable_to_non_nullable
                      as String,
            kmAtMaintenance: null == kmAtMaintenance
                ? _value.kmAtMaintenance
                : kmAtMaintenance // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            cost: freezed == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MaintenanceModelImplCopyWith<$Res>
    implements $MaintenanceModelCopyWith<$Res> {
  factory _$$MaintenanceModelImplCopyWith(
    _$MaintenanceModelImpl value,
    $Res Function(_$MaintenanceModelImpl) then,
  ) = __$$MaintenanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String vehicleId,
    DateTime date,
    String maintenanceType,
    int kmAtMaintenance,
    String notes,
    double? cost,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$MaintenanceModelImplCopyWithImpl<$Res>
    extends _$MaintenanceModelCopyWithImpl<$Res, _$MaintenanceModelImpl>
    implements _$$MaintenanceModelImplCopyWith<$Res> {
  __$$MaintenanceModelImplCopyWithImpl(
    _$MaintenanceModelImpl _value,
    $Res Function(_$MaintenanceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MaintenanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? date = null,
    Object? maintenanceType = null,
    Object? kmAtMaintenance = null,
    Object? notes = null,
    Object? cost = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$MaintenanceModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        maintenanceType: null == maintenanceType
            ? _value.maintenanceType
            : maintenanceType // ignore: cast_nullable_to_non_nullable
                  as String,
        kmAtMaintenance: null == kmAtMaintenance
            ? _value.kmAtMaintenance
            : kmAtMaintenance // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        cost: freezed == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceModelImpl implements _MaintenanceModel {
  const _$MaintenanceModelImpl({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.maintenanceType,
    required this.kmAtMaintenance,
    required this.notes,
    required this.cost,
    required this.createdAt,
  });

  factory _$MaintenanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String vehicleId;
  @override
  final DateTime date;
  @override
  final String maintenanceType;
  // "oil" | "tire" | "inspection" | "repair" | "other"
  @override
  final int kmAtMaintenance;
  @override
  final String notes;
  @override
  final double? cost;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MaintenanceModel(id: $id, vehicleId: $vehicleId, date: $date, maintenanceType: $maintenanceType, kmAtMaintenance: $kmAtMaintenance, notes: $notes, cost: $cost, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.maintenanceType, maintenanceType) ||
                other.maintenanceType == maintenanceType) &&
            (identical(other.kmAtMaintenance, kmAtMaintenance) ||
                other.kmAtMaintenance == kmAtMaintenance) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    vehicleId,
    date,
    maintenanceType,
    kmAtMaintenance,
    notes,
    cost,
    createdAt,
  );

  /// Create a copy of MaintenanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceModelImplCopyWith<_$MaintenanceModelImpl> get copyWith =>
      __$$MaintenanceModelImplCopyWithImpl<_$MaintenanceModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceModelImplToJson(this);
  }
}

abstract class _MaintenanceModel implements MaintenanceModel {
  const factory _MaintenanceModel({
    required final String id,
    required final String vehicleId,
    required final DateTime date,
    required final String maintenanceType,
    required final int kmAtMaintenance,
    required final String notes,
    required final double? cost,
    required final DateTime createdAt,
  }) = _$MaintenanceModelImpl;

  factory _MaintenanceModel.fromJson(Map<String, dynamic> json) =
      _$MaintenanceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get vehicleId;
  @override
  DateTime get date;
  @override
  String get maintenanceType; // "oil" | "tire" | "inspection" | "repair" | "other"
  @override
  int get kmAtMaintenance;
  @override
  String get notes;
  @override
  double? get cost;
  @override
  DateTime get createdAt;

  /// Create a copy of MaintenanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceModelImplCopyWith<_$MaintenanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
