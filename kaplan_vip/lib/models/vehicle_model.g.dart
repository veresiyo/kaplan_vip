// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleModelImpl _$$VehicleModelImplFromJson(Map<String, dynamic> json) =>
    _$VehicleModelImpl(
      id: json['id'] as String,
      plate: json['plate'] as String,
      brandModel: json['brandModel'] as String,
      status: json['status'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      currentDriverId: json['currentDriverId'] as String,
      dailyJobCount: (json['dailyJobCount'] as num).toInt(),
      monthlyHoursWorked: (json['monthlyHoursWorked'] as num).toInt(),
      monthlyKm: (json['monthlyKm'] as num).toInt(),
      lastMaintenanceDate: DateTime.parse(
        json['lastMaintenanceDate'] as String,
      ),
      lastMaintenanceKm: (json['lastMaintenanceKm'] as num).toInt(),
      nextMaintenanceKm: (json['nextMaintenanceKm'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$VehicleModelImplToJson(_$VehicleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plate': instance.plate,
      'brandModel': instance.brandModel,
      'status': instance.status,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'currentDriverId': instance.currentDriverId,
      'dailyJobCount': instance.dailyJobCount,
      'monthlyHoursWorked': instance.monthlyHoursWorked,
      'monthlyKm': instance.monthlyKm,
      'lastMaintenanceDate': instance.lastMaintenanceDate.toIso8601String(),
      'lastMaintenanceKm': instance.lastMaintenanceKm,
      'nextMaintenanceKm': instance.nextMaintenanceKm,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
