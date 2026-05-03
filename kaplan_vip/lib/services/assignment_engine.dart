import 'dart:math' as math;

import 'package:kaplan_vip/core/constants/app_constants.dart';
import 'package:kaplan_vip/models/driver_model.dart';
import 'package:kaplan_vip/models/transfer_model.dart';
import 'package:kaplan_vip/models/vehicle_model.dart';

class AssignmentSuggestion {
  final String vehicleId;
  final String driverId;
  final String vehiclePlate;
  final String driverName;
  final double matchScore;
  final String reason;
  final double locationDistance;
  final int dailyJobCount;
  final double equityScore;

  AssignmentSuggestion({
    required this.vehicleId,
    required this.driverId,
    required this.vehiclePlate,
    required this.driverName,
    required this.matchScore,
    required this.reason,
    required this.locationDistance,
    required this.dailyJobCount,
    required this.equityScore,
  });
}

class EquitableAssignmentEngine {
  /// Ana adil atama algoritması
  static List<AssignmentSuggestion> suggestBestAssignments({
    required List<VehicleModel> vehicles,
    required List<DriverModel> drivers,
    required TransferModel transfer,
    required Map<String, int> vehicleDailyJobCount,
  }) {
    // Filter: Bakımda veya işsiz araçları hariç tut
    final availableVehicles = vehicles.where((v) => v.status == AppConstants.statusActive).toList();

    if (availableVehicles.isEmpty) {
      return [];
    }

    // Her araç için score hesapla
    final scores = <String, (AssignmentSuggestion, double)>{};

    for (final vehicle in availableVehicles) {
      final driver = drivers.firstWhere(
        (d) => d.id == vehicle.currentDriverId,
        orElse: () => DriverModel(
          id: 'unknown',
          name: 'Unknown',
          phone: '',
          homeLatitude: 0,
          homeLongitude: 0,
          homeLocation: 'Unknown',
          licenseNumber: '',
          monthlyHoursWorked: 0,
          monthlyKm: 0,
          nonRevenueJobCount: 0,
          equityScore: double.maxFinite,
          createdAt: DateTime.now(),
        ),
      );

      if (driver.id == 'unknown') continue;

      // Lokasyon uzaklığı hesapla (basit Euclidean distance)
      final locationDistance = _calculateDistance(
        vehicle.latitude,
        vehicle.longitude,
        0, // Transfer başlangıç koordinatı (gerçek değer geçirilmeli)
        0,
      );

      // Bugünün iş sayısı
      final todayJobs = vehicleDailyJobCount[vehicle.id] ?? 0;

      // Uygunluk skoru hesapla
      final score = _calculateMatchScore(
        driver: driver,
        locationDistance: locationDistance,
        todayJobCount: todayJobs,
        isRevenueTransfer: transfer.isRevenue,
      );

      final reason = _generateReason(
        driver: driver,
        locationDistance: locationDistance,
        todayJobCount: todayJobs,
        isRevenueTransfer: transfer.isRevenue,
      );

      final suggestion = AssignmentSuggestion(
        vehicleId: vehicle.id,
        driverId: driver.id,
        vehiclePlate: vehicle.plate,
        driverName: driver.name,
        matchScore: score,
        reason: reason,
        locationDistance: locationDistance,
        dailyJobCount: todayJobs,
        equityScore: driver.equityScore,
      );

      scores[vehicle.id] = (suggestion, score);
    }

    // Score'a göre sırala (yüksek skor = daha uygun)
    final sortedScores = scores.values.toList();
    sortedScores.sort((a, b) => b.$2.compareTo(a.$2));

    // Top 3 önerisi döndür
    return sortedScores.take(AppConstants.maxSuggestedAlternatives).map((s) => s.$1).toList();
  }

  /// Uygunluk skoru hesapla
  static double _calculateMatchScore({
    required DriverModel driver,
    required double locationDistance,
    required int todayJobCount,
    required bool isRevenueTransfer,
  }) {
    double score = 100.0;

    // Equity Score (Düşükse, o araç daha ihtiyacımız var)
    score -= driver.equityScore * AppConstants.hourWeight;

    // Lokasyon efisiyansı (yakınsa, skor artar)
    if (locationDistance < 10) {
      score += AppConstants.locationEfficiencyBonus * 20;
    } else if (locationDistance < 25) {
      score += AppConstants.locationEfficiencyBonus * 10;
    } else {
      score -= locationDistance * 0.5;
    }

    // Bugünün iş yükü (çok işi varsa, skor azalır)
    score -= todayJobCount * AppConstants.todayJobCountPenalty;

    // Kazançsız işse, adalet skoru ekstra azalt
    if (!isRevenueTransfer) {
      score -= 30; // Non-revenue işte daha adil dağılım için
    }

    return score;
  }

  /// Atama gerekçesi oluştur
  static String _generateReason({
    required DriverModel driver,
    required double locationDistance,
    required int todayJobCount,
    required bool isRevenueTransfer,
  }) {
    final reasons = <String>[];

    if (todayJobCount < 2) {
      reasons.add('${driver.name} bugün az iş yaptı ($todayJobCount iş)');
    }

    if (locationDistance < 15) {
      reasons.add('Ev konumu işe çok yakın (${locationDistance.toStringAsFixed(1)} km)');
    }

    if (driver.equityScore < 80) {
      reasons.add('Aylık adalet puanı düşük (${driver.equityScore.toStringAsFixed(1)})');
    }

    if (!isRevenueTransfer) {
      reasons.add('Personel/Bagaj işinde adil dağılım sağlanıyor');
    }

    return reasons.isNotEmpty ? reasons.join('. ') : '${driver.name} şu anda uygun durumda';
  }

  /// Haversine distance formülü (km cinsinden)
  static double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadiusKm = 6371.0;

    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a =
        (math.sin(dLat / 2) * math.sin(dLat / 2)) +
        (math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2));

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadiusKm * c;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }
}
