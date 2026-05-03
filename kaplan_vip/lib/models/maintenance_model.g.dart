// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceModelImpl _$$MaintenanceModelImplFromJson(
  Map<String, dynamic> json,
) => _$MaintenanceModelImpl(
  id: json['id'] as String,
  vehicleId: json['vehicleId'] as String,
  date: DateTime.parse(json['date'] as String),
  maintenanceType: json['maintenanceType'] as String,
  kmAtMaintenance: (json['kmAtMaintenance'] as num).toInt(),
  notes: json['notes'] as String,
  cost: (json['cost'] as num?)?.toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$MaintenanceModelImplToJson(
  _$MaintenanceModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'vehicleId': instance.vehicleId,
  'date': instance.date.toIso8601String(),
  'maintenanceType': instance.maintenanceType,
  'kmAtMaintenance': instance.kmAtMaintenance,
  'notes': instance.notes,
  'cost': instance.cost,
  'createdAt': instance.createdAt.toIso8601String(),
};
