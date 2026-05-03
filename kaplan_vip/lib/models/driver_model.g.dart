// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverModelImpl _$$DriverModelImplFromJson(Map<String, dynamic> json) =>
    _$DriverModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      homeLatitude: (json['homeLatitude'] as num).toDouble(),
      homeLongitude: (json['homeLongitude'] as num).toDouble(),
      homeLocation: json['homeLocation'] as String,
      licenseNumber: json['licenseNumber'] as String,
      monthlyHoursWorked: (json['monthlyHoursWorked'] as num).toInt(),
      monthlyKm: (json['monthlyKm'] as num).toInt(),
      nonRevenueJobCount: (json['nonRevenueJobCount'] as num).toInt(),
      equityScore: (json['equityScore'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DriverModelImplToJson(_$DriverModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'homeLatitude': instance.homeLatitude,
      'homeLongitude': instance.homeLongitude,
      'homeLocation': instance.homeLocation,
      'licenseNumber': instance.licenseNumber,
      'monthlyHoursWorked': instance.monthlyHoursWorked,
      'monthlyKm': instance.monthlyKm,
      'nonRevenueJobCount': instance.nonRevenueJobCount,
      'equityScore': instance.equityScore,
      'createdAt': instance.createdAt.toIso8601String(),
    };
