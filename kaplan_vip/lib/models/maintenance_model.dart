import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_model.freezed.dart';
part 'maintenance_model.g.dart';

@freezed
class MaintenanceModel with _$MaintenanceModel {
  const factory MaintenanceModel({
    required String id,
    required String vehicleId,
    required DateTime date,
    required String maintenanceType, // "oil" | "tire" | "inspection" | "repair" | "other"
    required int kmAtMaintenance,
    required String notes,
    required double? cost,
    required DateTime createdAt,
  }) = _MaintenanceModel;

  factory MaintenanceModel.fromJson(Map<String, dynamic> json) => _$MaintenanceModelFromJson(json);
}
