import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaplan_vip/models/driver_model.dart';
import 'package:kaplan_vip/models/transfer_model.dart';
import 'package:kaplan_vip/models/vehicle_model.dart';
import 'package:kaplan_vip/services/assignment_engine.dart';
import 'package:kaplan_vip/services/firebase_service.dart';

// Firebase Service Provider
final firebaseServiceProvider = Provider((ref) => FirebaseService());

// Araçlar Provider (Realtime DB'den)
final vehiclesStreamProvider = StreamProvider<Map<String, dynamic>>((ref) {
  final service = ref.watch(firebaseServiceProvider);
  return service.getVehiclesLocationStream();
});

// Şoförler Provider
final driversProvider = FutureProvider<List<DriverModel>>((ref) {
  final service = ref.watch(firebaseServiceProvider);
  return service.getDrivers();
});

// Araçlar (Firestore'dan - metadata)
final vehiclesProvider = FutureProvider<List<VehicleModel>>((ref) {
  final service = ref.watch(firebaseServiceProvider);
  return service.getVehicles();
});

// Bugünün transferleri
final todayTransfersProvider = FutureProvider<List<TransferModel>>((ref) {
  final service = ref.watch(firebaseServiceProvider);
  return service.getTodayTransfers();
});

// Uçuş durumları (Realtime DB'den)
final flightsStreamProvider = StreamProvider<Map<String, dynamic>>((ref) {
  final service = ref.watch(firebaseServiceProvider);
  return service.getFlightsStream();
});

// Atama önerileri provider
final assignmentSuggestionsProvider =
    FutureProvider.family<List<AssignmentSuggestion>, TransferModel>((ref, transfer) async {
  final vehicles = await ref.watch(vehiclesProvider.future);
  final drivers = await ref.watch(driversProvider.future);

  // Her araç için bugünün iş sayısını hesapla
  final todayTransfers = await ref.watch(todayTransfersProvider.future);
  final vehicleDailyJobCount = <String, int>{};

  for (final v in vehicles) {
    vehicleDailyJobCount[v.id] = todayTransfers
        .where((t) => t.vehicleId == v.id && t.status != 'cancelled')
        .length;
  }

  return EquitableAssignmentEngine.suggestBestAssignments(
    vehicles: vehicles,
    drivers: drivers,
    transfer: transfer,
    vehicleDailyJobCount: vehicleDailyJobCount,
  );
});

// State Notifier Providers (Uygulamayı kontrol etmek için)

// Seçili transfer
class SelectedTransferNotifier extends StateNotifier<TransferModel?> {
  SelectedTransferNotifier() : super(null);

  void setTransfer(TransferModel transfer) {
    state = transfer;
  }

  void clear() {
    state = null;
  }
}

final selectedTransferProvider =
    StateNotifierProvider<SelectedTransferNotifier, TransferModel?>((ref) {
  return SelectedTransferNotifier();
});

// Operasyon filtresi
class OperationFilterNotifier extends StateNotifier<String> {
  OperationFilterNotifier() : super('all');

  void setFilter(String filter) {
    state = filter;
  }
}

final operationFilterProvider =
    StateNotifierProvider<OperationFilterNotifier, String>((ref) {
  return OperationFilterNotifier();
});
