import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_model.freezed.dart';
part 'driver_model.g.dart';

@freezed
class DriverModel with _$DriverModel {
  const factory DriverModel({
    required String id,
    required String name,
    required String phone, // Şifreli tutulur
    required double homeLatitude,
    required double homeLongitude,
    required String homeLocation, // "Konyaaltı" | "Lara" | "Muratpaşa"
    required String licenseNumber,
    required int monthlyHoursWorked,
    required int monthlyKm,
    required int nonRevenueJobCount,
    required double equityScore,
    required DateTime createdAt,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) => _$DriverModelFromJson(json);
}
