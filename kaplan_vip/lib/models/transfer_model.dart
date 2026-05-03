import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

@freezed
class TransferModel with _$TransferModel {
  const factory TransferModel({
    required String id,
    required DateTime date,
    required String timeStart, // "HH:mm"
    required String timeEnd, // "HH:mm"
    required String locationFrom, // "AYT_T1" | "AYT_T2" | "AYT_CIP" | "BELEK" | "KEMER"
    required String locationTo,
    required String vehicleId,
    required String driverId,
    required String passengerCode, // Şifreli - numara değil
    required String? flightNumber,
    required String flightType, // "domestic" | "international" | "charter"
    required bool isRevenue,
    required int estimatedKm,
    required String status, // "pending" | "assigned" | "completed" | "cancelled"
    required String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransferModel;

  factory TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);
}
