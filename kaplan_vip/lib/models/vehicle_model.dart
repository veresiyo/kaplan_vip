import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

@freezed
class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    required String id,
    required String plate,
    required String brandModel,
    required String status, // "active" | "maintenance" | "retired"
    required double latitude,
    required double longitude,
    required String currentDriverId,
    required int dailyJobCount,
    required int monthlyHoursWorked,
    required int monthlyKm,
    required DateTime lastMaintenanceDate,
    required int lastMaintenanceKm,
    required int nextMaintenanceKm,
    required DateTime lastUpdated,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);
}
