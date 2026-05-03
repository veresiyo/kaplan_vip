// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferModelImpl _$$TransferModelImplFromJson(Map<String, dynamic> json) =>
    _$TransferModelImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      timeStart: json['timeStart'] as String,
      timeEnd: json['timeEnd'] as String,
      locationFrom: json['locationFrom'] as String,
      locationTo: json['locationTo'] as String,
      vehicleId: json['vehicleId'] as String,
      driverId: json['driverId'] as String,
      passengerCode: json['passengerCode'] as String,
      flightNumber: json['flightNumber'] as String?,
      flightType: json['flightType'] as String,
      isRevenue: json['isRevenue'] as bool,
      estimatedKm: (json['estimatedKm'] as num).toInt(),
      status: json['status'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TransferModelImplToJson(_$TransferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'locationFrom': instance.locationFrom,
      'locationTo': instance.locationTo,
      'vehicleId': instance.vehicleId,
      'driverId': instance.driverId,
      'passengerCode': instance.passengerCode,
      'flightNumber': instance.flightNumber,
      'flightType': instance.flightType,
      'isRevenue': instance.isRevenue,
      'estimatedKm': instance.estimatedKm,
      'status': instance.status,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
