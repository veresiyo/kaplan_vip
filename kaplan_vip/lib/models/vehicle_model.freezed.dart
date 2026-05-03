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
  String get id => throw _privateConstructorUsedError;
  String get plate => throw _privateConstructorUsedError;
  String get brandModel => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // "active" | "maintenance" | "retired"
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get currentDriverId => throw _privateConstructorUsedError;
  int get dailyJobCount => throw _privateConstructorUsedError;
  int get monthlyHoursWorked => throw _privateConstructorUsedError;
  int get monthlyKm => throw _privateConstructorUsedError;
  DateTime get lastMaintenanceDate => throw _privateConstructorUsedError;
  int get lastMaintenanceKm => throw _privateConstructorUsedError;
  int get nextMaintenanceKm => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

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
  $Res call({
    String id,
    String plate,
    String brandModel,
    String status,
    double latitude,
    double longitude,
    String currentDriverId,
    int dailyJobCount,
    int monthlyHoursWorked,
    int monthlyKm,
    DateTime lastMaintenanceDate,
    int lastMaintenanceKm,
    int nextMaintenanceKm,
    DateTime lastUpdated,
  });
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
    Object? plate = null,
    Object? brandModel = null,
    Object? status = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? currentDriverId = null,
    Object? dailyJobCount = null,
    Object? monthlyHoursWorked = null,
    Object? monthlyKm = null,
    Object? lastMaintenanceDate = null,
    Object? lastMaintenanceKm = null,
    Object? nextMaintenanceKm = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            plate: null == plate
                ? _value.plate
                : plate // ignore: cast_nullable_to_non_nullable
                      as String,
            brandModel: null == brandModel
                ? _value.brandModel
                : brandModel // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            currentDriverId: null == currentDriverId
                ? _value.currentDriverId
                : currentDriverId // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyJobCount: null == dailyJobCount
                ? _value.dailyJobCount
                : dailyJobCount // ignore: cast_nullable_to_non_nullable
                      as int,
            monthlyHoursWorked: null == monthlyHoursWorked
                ? _value.monthlyHoursWorked
                : monthlyHoursWorked // ignore: cast_nullable_to_non_nullable
                      as int,
            monthlyKm: null == monthlyKm
                ? _value.monthlyKm
                : monthlyKm // ignore: cast_nullable_to_non_nullable
                      as int,
            lastMaintenanceDate: null == lastMaintenanceDate
                ? _value.lastMaintenanceDate
                : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastMaintenanceKm: null == lastMaintenanceKm
                ? _value.lastMaintenanceKm
                : lastMaintenanceKm // ignore: cast_nullable_to_non_nullable
                      as int,
            nextMaintenanceKm: null == nextMaintenanceKm
                ? _value.nextMaintenanceKm
                : nextMaintenanceKm // ignore: cast_nullable_to_non_nullable
                      as int,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
  $Res call({
    String id,
    String plate,
    String brandModel,
    String status,
    double latitude,
    double longitude,
    String currentDriverId,
    int dailyJobCount,
    int monthlyHoursWorked,
    int monthlyKm,
    DateTime lastMaintenanceDate,
    int lastMaintenanceKm,
    int nextMaintenanceKm,
    DateTime lastUpdated,
  });
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
    Object? plate = null,
    Object? brandModel = null,
    Object? status = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? currentDriverId = null,
    Object? dailyJobCount = null,
    Object? monthlyHoursWorked = null,
    Object? monthlyKm = null,
    Object? lastMaintenanceDate = null,
    Object? lastMaintenanceKm = null,
    Object? nextMaintenanceKm = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$VehicleModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        plate: null == plate
            ? _value.plate
            : plate // ignore: cast_nullable_to_non_nullable
                  as String,
        brandModel: null == brandModel
            ? _value.brandModel
            : brandModel // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        currentDriverId: null == currentDriverId
            ? _value.currentDriverId
            : currentDriverId // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyJobCount: null == dailyJobCount
            ? _value.dailyJobCount
            : dailyJobCount // ignore: cast_nullable_to_non_nullable
                  as int,
        monthlyHoursWorked: null == monthlyHoursWorked
            ? _value.monthlyHoursWorked
            : monthlyHoursWorked // ignore: cast_nullable_to_non_nullable
                  as int,
        monthlyKm: null == monthlyKm
            ? _value.monthlyKm
            : monthlyKm // ignore: cast_nullable_to_non_nullable
                  as int,
        lastMaintenanceDate: null == lastMaintenanceDate
            ? _value.lastMaintenanceDate
            : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastMaintenanceKm: null == lastMaintenanceKm
            ? _value.lastMaintenanceKm
            : lastMaintenanceKm // ignore: cast_nullable_to_non_nullable
                  as int,
        nextMaintenanceKm: null == nextMaintenanceKm
            ? _value.nextMaintenanceKm
            : nextMaintenanceKm // ignore: cast_nullable_to_non_nullable
                  as int,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleModelImpl implements _VehicleModel {
  const _$VehicleModelImpl({
    required this.id,
    required this.plate,
    required this.brandModel,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.currentDriverId,
    required this.dailyJobCount,
    required this.monthlyHoursWorked,
    required this.monthlyKm,
    required this.lastMaintenanceDate,
    required this.lastMaintenanceKm,
    required this.nextMaintenanceKm,
    required this.lastUpdated,
  });

  factory _$VehicleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String plate;
  @override
  final String brandModel;
  @override
  final String status;
  // "active" | "maintenance" | "retired"
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String currentDriverId;
  @override
  final int dailyJobCount;
  @override
  final int monthlyHoursWorked;
  @override
  final int monthlyKm;
  @override
  final DateTime lastMaintenanceDate;
  @override
  final int lastMaintenanceKm;
  @override
  final int nextMaintenanceKm;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'VehicleModel(id: $id, plate: $plate, brandModel: $brandModel, status: $status, latitude: $latitude, longitude: $longitude, currentDriverId: $currentDriverId, dailyJobCount: $dailyJobCount, monthlyHoursWorked: $monthlyHoursWorked, monthlyKm: $monthlyKm, lastMaintenanceDate: $lastMaintenanceDate, lastMaintenanceKm: $lastMaintenanceKm, nextMaintenanceKm: $nextMaintenanceKm, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.plate, plate) || other.plate == plate) &&
            (identical(other.brandModel, brandModel) ||
                other.brandModel == brandModel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.currentDriverId, currentDriverId) ||
                other.currentDriverId == currentDriverId) &&
            (identical(other.dailyJobCount, dailyJobCount) ||
                other.dailyJobCount == dailyJobCount) &&
            (identical(other.monthlyHoursWorked, monthlyHoursWorked) ||
                other.monthlyHoursWorked == monthlyHoursWorked) &&
            (identical(other.monthlyKm, monthlyKm) ||
                other.monthlyKm == monthlyKm) &&
            (identical(other.lastMaintenanceDate, lastMaintenanceDate) ||
                other.lastMaintenanceDate == lastMaintenanceDate) &&
            (identical(other.lastMaintenanceKm, lastMaintenanceKm) ||
                other.lastMaintenanceKm == lastMaintenanceKm) &&
            (identical(other.nextMaintenanceKm, nextMaintenanceKm) ||
                other.nextMaintenanceKm == nextMaintenanceKm) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    plate,
    brandModel,
    status,
    latitude,
    longitude,
    currentDriverId,
    dailyJobCount,
    monthlyHoursWorked,
    monthlyKm,
    lastMaintenanceDate,
    lastMaintenanceKm,
    nextMaintenanceKm,
    lastUpdated,
  );

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
    required final String id,
    required final String plate,
    required final String brandModel,
    required final String status,
    required final double latitude,
    required final double longitude,
    required final String currentDriverId,
    required final int dailyJobCount,
    required final int monthlyHoursWorked,
    required final int monthlyKm,
    required final DateTime lastMaintenanceDate,
    required final int lastMaintenanceKm,
    required final int nextMaintenanceKm,
    required final DateTime lastUpdated,
  }) = _$VehicleModelImpl;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$VehicleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get plate;
  @override
  String get brandModel;
  @override
  String get status; // "active" | "maintenance" | "retired"
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get currentDriverId;
  @override
  int get dailyJobCount;
  @override
  int get monthlyHoursWorked;
  @override
  int get monthlyKm;
  @override
  DateTime get lastMaintenanceDate;
  @override
  int get lastMaintenanceKm;
  @override
  int get nextMaintenanceKm;
  @override
  DateTime get lastUpdated;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
