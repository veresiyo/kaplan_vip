// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) {
  return _TransferModel.fromJson(json);
}

/// @nodoc
mixin _$TransferModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get timeStart => throw _privateConstructorUsedError; // "HH:mm"
  String get timeEnd => throw _privateConstructorUsedError; // "HH:mm"
  String get locationFrom =>
      throw _privateConstructorUsedError; // "AYT_T1" | "AYT_T2" | "AYT_CIP" | "BELEK" | "KEMER"
  String get locationTo => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  String get passengerCode =>
      throw _privateConstructorUsedError; // Şifreli - numara değil
  String? get flightNumber => throw _privateConstructorUsedError;
  String get flightType =>
      throw _privateConstructorUsedError; // "domestic" | "international" | "charter"
  bool get isRevenue => throw _privateConstructorUsedError;
  int get estimatedKm => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // "pending" | "assigned" | "completed" | "cancelled"
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TransferModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferModelCopyWith<TransferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferModelCopyWith<$Res> {
  factory $TransferModelCopyWith(
    TransferModel value,
    $Res Function(TransferModel) then,
  ) = _$TransferModelCopyWithImpl<$Res, TransferModel>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    String timeStart,
    String timeEnd,
    String locationFrom,
    String locationTo,
    String vehicleId,
    String driverId,
    String passengerCode,
    String? flightNumber,
    String flightType,
    bool isRevenue,
    int estimatedKm,
    String status,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$TransferModelCopyWithImpl<$Res, $Val extends TransferModel>
    implements $TransferModelCopyWith<$Res> {
  _$TransferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? timeStart = null,
    Object? timeEnd = null,
    Object? locationFrom = null,
    Object? locationTo = null,
    Object? vehicleId = null,
    Object? driverId = null,
    Object? passengerCode = null,
    Object? flightNumber = freezed,
    Object? flightType = null,
    Object? isRevenue = null,
    Object? estimatedKm = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            timeStart: null == timeStart
                ? _value.timeStart
                : timeStart // ignore: cast_nullable_to_non_nullable
                      as String,
            timeEnd: null == timeEnd
                ? _value.timeEnd
                : timeEnd // ignore: cast_nullable_to_non_nullable
                      as String,
            locationFrom: null == locationFrom
                ? _value.locationFrom
                : locationFrom // ignore: cast_nullable_to_non_nullable
                      as String,
            locationTo: null == locationTo
                ? _value.locationTo
                : locationTo // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            driverId: null == driverId
                ? _value.driverId
                : driverId // ignore: cast_nullable_to_non_nullable
                      as String,
            passengerCode: null == passengerCode
                ? _value.passengerCode
                : passengerCode // ignore: cast_nullable_to_non_nullable
                      as String,
            flightNumber: freezed == flightNumber
                ? _value.flightNumber
                : flightNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            flightType: null == flightType
                ? _value.flightType
                : flightType // ignore: cast_nullable_to_non_nullable
                      as String,
            isRevenue: null == isRevenue
                ? _value.isRevenue
                : isRevenue // ignore: cast_nullable_to_non_nullable
                      as bool,
            estimatedKm: null == estimatedKm
                ? _value.estimatedKm
                : estimatedKm // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransferModelImplCopyWith<$Res>
    implements $TransferModelCopyWith<$Res> {
  factory _$$TransferModelImplCopyWith(
    _$TransferModelImpl value,
    $Res Function(_$TransferModelImpl) then,
  ) = __$$TransferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    String timeStart,
    String timeEnd,
    String locationFrom,
    String locationTo,
    String vehicleId,
    String driverId,
    String passengerCode,
    String? flightNumber,
    String flightType,
    bool isRevenue,
    int estimatedKm,
    String status,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$TransferModelImplCopyWithImpl<$Res>
    extends _$TransferModelCopyWithImpl<$Res, _$TransferModelImpl>
    implements _$$TransferModelImplCopyWith<$Res> {
  __$$TransferModelImplCopyWithImpl(
    _$TransferModelImpl _value,
    $Res Function(_$TransferModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? timeStart = null,
    Object? timeEnd = null,
    Object? locationFrom = null,
    Object? locationTo = null,
    Object? vehicleId = null,
    Object? driverId = null,
    Object? passengerCode = null,
    Object? flightNumber = freezed,
    Object? flightType = null,
    Object? isRevenue = null,
    Object? estimatedKm = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$TransferModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        timeStart: null == timeStart
            ? _value.timeStart
            : timeStart // ignore: cast_nullable_to_non_nullable
                  as String,
        timeEnd: null == timeEnd
            ? _value.timeEnd
            : timeEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        locationFrom: null == locationFrom
            ? _value.locationFrom
            : locationFrom // ignore: cast_nullable_to_non_nullable
                  as String,
        locationTo: null == locationTo
            ? _value.locationTo
            : locationTo // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        driverId: null == driverId
            ? _value.driverId
            : driverId // ignore: cast_nullable_to_non_nullable
                  as String,
        passengerCode: null == passengerCode
            ? _value.passengerCode
            : passengerCode // ignore: cast_nullable_to_non_nullable
                  as String,
        flightNumber: freezed == flightNumber
            ? _value.flightNumber
            : flightNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        flightType: null == flightType
            ? _value.flightType
            : flightType // ignore: cast_nullable_to_non_nullable
                  as String,
        isRevenue: null == isRevenue
            ? _value.isRevenue
            : isRevenue // ignore: cast_nullable_to_non_nullable
                  as bool,
        estimatedKm: null == estimatedKm
            ? _value.estimatedKm
            : estimatedKm // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferModelImpl implements _TransferModel {
  const _$TransferModelImpl({
    required this.id,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.locationFrom,
    required this.locationTo,
    required this.vehicleId,
    required this.driverId,
    required this.passengerCode,
    required this.flightNumber,
    required this.flightType,
    required this.isRevenue,
    required this.estimatedKm,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$TransferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String timeStart;
  // "HH:mm"
  @override
  final String timeEnd;
  // "HH:mm"
  @override
  final String locationFrom;
  // "AYT_T1" | "AYT_T2" | "AYT_CIP" | "BELEK" | "KEMER"
  @override
  final String locationTo;
  @override
  final String vehicleId;
  @override
  final String driverId;
  @override
  final String passengerCode;
  // Şifreli - numara değil
  @override
  final String? flightNumber;
  @override
  final String flightType;
  // "domestic" | "international" | "charter"
  @override
  final bool isRevenue;
  @override
  final int estimatedKm;
  @override
  final String status;
  // "pending" | "assigned" | "completed" | "cancelled"
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TransferModel(id: $id, date: $date, timeStart: $timeStart, timeEnd: $timeEnd, locationFrom: $locationFrom, locationTo: $locationTo, vehicleId: $vehicleId, driverId: $driverId, passengerCode: $passengerCode, flightNumber: $flightNumber, flightType: $flightType, isRevenue: $isRevenue, estimatedKm: $estimatedKm, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd) &&
            (identical(other.locationFrom, locationFrom) ||
                other.locationFrom == locationFrom) &&
            (identical(other.locationTo, locationTo) ||
                other.locationTo == locationTo) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.passengerCode, passengerCode) ||
                other.passengerCode == passengerCode) &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.flightType, flightType) ||
                other.flightType == flightType) &&
            (identical(other.isRevenue, isRevenue) ||
                other.isRevenue == isRevenue) &&
            (identical(other.estimatedKm, estimatedKm) ||
                other.estimatedKm == estimatedKm) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    timeStart,
    timeEnd,
    locationFrom,
    locationTo,
    vehicleId,
    driverId,
    passengerCode,
    flightNumber,
    flightType,
    isRevenue,
    estimatedKm,
    status,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferModelImplCopyWith<_$TransferModelImpl> get copyWith =>
      __$$TransferModelImplCopyWithImpl<_$TransferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferModelImplToJson(this);
  }
}

abstract class _TransferModel implements TransferModel {
  const factory _TransferModel({
    required final String id,
    required final DateTime date,
    required final String timeStart,
    required final String timeEnd,
    required final String locationFrom,
    required final String locationTo,
    required final String vehicleId,
    required final String driverId,
    required final String passengerCode,
    required final String? flightNumber,
    required final String flightType,
    required final bool isRevenue,
    required final int estimatedKm,
    required final String status,
    required final String? notes,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$TransferModelImpl;

  factory _TransferModel.fromJson(Map<String, dynamic> json) =
      _$TransferModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get timeStart; // "HH:mm"
  @override
  String get timeEnd; // "HH:mm"
  @override
  String get locationFrom; // "AYT_T1" | "AYT_T2" | "AYT_CIP" | "BELEK" | "KEMER"
  @override
  String get locationTo;
  @override
  String get vehicleId;
  @override
  String get driverId;
  @override
  String get passengerCode; // Şifreli - numara değil
  @override
  String? get flightNumber;
  @override
  String get flightType; // "domestic" | "international" | "charter"
  @override
  bool get isRevenue;
  @override
  int get estimatedKm;
  @override
  String get status; // "pending" | "assigned" | "completed" | "cancelled"
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferModelImplCopyWith<_$TransferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
