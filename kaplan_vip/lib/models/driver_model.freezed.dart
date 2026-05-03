// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) {
  return _DriverModel.fromJson(json);
}

/// @nodoc
mixin _$DriverModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError; // Şifreli tutulur
  double get homeLatitude => throw _privateConstructorUsedError;
  double get homeLongitude => throw _privateConstructorUsedError;
  String get homeLocation =>
      throw _privateConstructorUsedError; // "Konyaaltı" | "Lara" | "Muratpaşa"
  String get licenseNumber => throw _privateConstructorUsedError;
  int get monthlyHoursWorked => throw _privateConstructorUsedError;
  int get monthlyKm => throw _privateConstructorUsedError;
  int get nonRevenueJobCount => throw _privateConstructorUsedError;
  double get equityScore => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DriverModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverModelCopyWith<DriverModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverModelCopyWith<$Res> {
  factory $DriverModelCopyWith(
    DriverModel value,
    $Res Function(DriverModel) then,
  ) = _$DriverModelCopyWithImpl<$Res, DriverModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String phone,
    double homeLatitude,
    double homeLongitude,
    String homeLocation,
    String licenseNumber,
    int monthlyHoursWorked,
    int monthlyKm,
    int nonRevenueJobCount,
    double equityScore,
    DateTime createdAt,
  });
}

/// @nodoc
class _$DriverModelCopyWithImpl<$Res, $Val extends DriverModel>
    implements $DriverModelCopyWith<$Res> {
  _$DriverModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? homeLatitude = null,
    Object? homeLongitude = null,
    Object? homeLocation = null,
    Object? licenseNumber = null,
    Object? monthlyHoursWorked = null,
    Object? monthlyKm = null,
    Object? nonRevenueJobCount = null,
    Object? equityScore = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            homeLatitude: null == homeLatitude
                ? _value.homeLatitude
                : homeLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            homeLongitude: null == homeLongitude
                ? _value.homeLongitude
                : homeLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            homeLocation: null == homeLocation
                ? _value.homeLocation
                : homeLocation // ignore: cast_nullable_to_non_nullable
                      as String,
            licenseNumber: null == licenseNumber
                ? _value.licenseNumber
                : licenseNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            monthlyHoursWorked: null == monthlyHoursWorked
                ? _value.monthlyHoursWorked
                : monthlyHoursWorked // ignore: cast_nullable_to_non_nullable
                      as int,
            monthlyKm: null == monthlyKm
                ? _value.monthlyKm
                : monthlyKm // ignore: cast_nullable_to_non_nullable
                      as int,
            nonRevenueJobCount: null == nonRevenueJobCount
                ? _value.nonRevenueJobCount
                : nonRevenueJobCount // ignore: cast_nullable_to_non_nullable
                      as int,
            equityScore: null == equityScore
                ? _value.equityScore
                : equityScore // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$DriverModelImplCopyWith<$Res>
    implements $DriverModelCopyWith<$Res> {
  factory _$$DriverModelImplCopyWith(
    _$DriverModelImpl value,
    $Res Function(_$DriverModelImpl) then,
  ) = __$$DriverModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String phone,
    double homeLatitude,
    double homeLongitude,
    String homeLocation,
    String licenseNumber,
    int monthlyHoursWorked,
    int monthlyKm,
    int nonRevenueJobCount,
    double equityScore,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$DriverModelImplCopyWithImpl<$Res>
    extends _$DriverModelCopyWithImpl<$Res, _$DriverModelImpl>
    implements _$$DriverModelImplCopyWith<$Res> {
  __$$DriverModelImplCopyWithImpl(
    _$DriverModelImpl _value,
    $Res Function(_$DriverModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? homeLatitude = null,
    Object? homeLongitude = null,
    Object? homeLocation = null,
    Object? licenseNumber = null,
    Object? monthlyHoursWorked = null,
    Object? monthlyKm = null,
    Object? nonRevenueJobCount = null,
    Object? equityScore = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$DriverModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        homeLatitude: null == homeLatitude
            ? _value.homeLatitude
            : homeLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        homeLongitude: null == homeLongitude
            ? _value.homeLongitude
            : homeLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        homeLocation: null == homeLocation
            ? _value.homeLocation
            : homeLocation // ignore: cast_nullable_to_non_nullable
                  as String,
        licenseNumber: null == licenseNumber
            ? _value.licenseNumber
            : licenseNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        monthlyHoursWorked: null == monthlyHoursWorked
            ? _value.monthlyHoursWorked
            : monthlyHoursWorked // ignore: cast_nullable_to_non_nullable
                  as int,
        monthlyKm: null == monthlyKm
            ? _value.monthlyKm
            : monthlyKm // ignore: cast_nullable_to_non_nullable
                  as int,
        nonRevenueJobCount: null == nonRevenueJobCount
            ? _value.nonRevenueJobCount
            : nonRevenueJobCount // ignore: cast_nullable_to_non_nullable
                  as int,
        equityScore: null == equityScore
            ? _value.equityScore
            : equityScore // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$DriverModelImpl implements _DriverModel {
  const _$DriverModelImpl({
    required this.id,
    required this.name,
    required this.phone,
    required this.homeLatitude,
    required this.homeLongitude,
    required this.homeLocation,
    required this.licenseNumber,
    required this.monthlyHoursWorked,
    required this.monthlyKm,
    required this.nonRevenueJobCount,
    required this.equityScore,
    required this.createdAt,
  });

  factory _$DriverModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  // Şifreli tutulur
  @override
  final double homeLatitude;
  @override
  final double homeLongitude;
  @override
  final String homeLocation;
  // "Konyaaltı" | "Lara" | "Muratpaşa"
  @override
  final String licenseNumber;
  @override
  final int monthlyHoursWorked;
  @override
  final int monthlyKm;
  @override
  final int nonRevenueJobCount;
  @override
  final double equityScore;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DriverModel(id: $id, name: $name, phone: $phone, homeLatitude: $homeLatitude, homeLongitude: $homeLongitude, homeLocation: $homeLocation, licenseNumber: $licenseNumber, monthlyHoursWorked: $monthlyHoursWorked, monthlyKm: $monthlyKm, nonRevenueJobCount: $nonRevenueJobCount, equityScore: $equityScore, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.homeLatitude, homeLatitude) ||
                other.homeLatitude == homeLatitude) &&
            (identical(other.homeLongitude, homeLongitude) ||
                other.homeLongitude == homeLongitude) &&
            (identical(other.homeLocation, homeLocation) ||
                other.homeLocation == homeLocation) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.monthlyHoursWorked, monthlyHoursWorked) ||
                other.monthlyHoursWorked == monthlyHoursWorked) &&
            (identical(other.monthlyKm, monthlyKm) ||
                other.monthlyKm == monthlyKm) &&
            (identical(other.nonRevenueJobCount, nonRevenueJobCount) ||
                other.nonRevenueJobCount == nonRevenueJobCount) &&
            (identical(other.equityScore, equityScore) ||
                other.equityScore == equityScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    homeLatitude,
    homeLongitude,
    homeLocation,
    licenseNumber,
    monthlyHoursWorked,
    monthlyKm,
    nonRevenueJobCount,
    equityScore,
    createdAt,
  );

  /// Create a copy of DriverModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverModelImplCopyWith<_$DriverModelImpl> get copyWith =>
      __$$DriverModelImplCopyWithImpl<_$DriverModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverModelImplToJson(this);
  }
}

abstract class _DriverModel implements DriverModel {
  const factory _DriverModel({
    required final String id,
    required final String name,
    required final String phone,
    required final double homeLatitude,
    required final double homeLongitude,
    required final String homeLocation,
    required final String licenseNumber,
    required final int monthlyHoursWorked,
    required final int monthlyKm,
    required final int nonRevenueJobCount,
    required final double equityScore,
    required final DateTime createdAt,
  }) = _$DriverModelImpl;

  factory _DriverModel.fromJson(Map<String, dynamic> json) =
      _$DriverModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone; // Şifreli tutulur
  @override
  double get homeLatitude;
  @override
  double get homeLongitude;
  @override
  String get homeLocation; // "Konyaaltı" | "Lara" | "Muratpaşa"
  @override
  String get licenseNumber;
  @override
  int get monthlyHoursWorked;
  @override
  int get monthlyKm;
  @override
  int get nonRevenueJobCount;
  @override
  double get equityScore;
  @override
  DateTime get createdAt;

  /// Create a copy of DriverModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverModelImplCopyWith<_$DriverModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
