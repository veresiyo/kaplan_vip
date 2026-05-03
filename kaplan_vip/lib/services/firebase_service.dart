import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kaplan_vip/core/constants/app_constants.dart';
import 'package:kaplan_vip/models/driver_model.dart';
import 'package:kaplan_vip/models/transfer_model.dart';
import 'package:kaplan_vip/models/vehicle_model.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  late FirebaseDatabase _realtimeDb;
  late FirebaseFirestore _firestore;

  Future<void> initialize() async {
    _realtimeDb = FirebaseDatabase.instance;
    _firestore = FirebaseFirestore.instance;
    
    // Persistence mode
    _realtimeDb.ref().keepSynced(true);
  }

  // =================== REALTIME DATABASE (Canlı Veriler) ===================

  /// Şoför konumunu güncelle
  Future<void> updateVehicleLocation({
    required String vehicleId,
    required double latitude,
    required double longitude,
    required String status,
  }) async {
    try {
      await _realtimeDb.ref('${AppConstants.fbPathVehicles}/$vehicleId').update({
        'latitude': latitude,
        'longitude': longitude,
        'status': status,
        'last_updated': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print('Error updating vehicle location: $e');
      rethrow;
    }
  }

  /// Canlı araç konumlarını dinle
  Stream<Map<String, dynamic>> getVehiclesLocationStream() {
    return _realtimeDb.ref(AppConstants.fbPathVehicles).onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      return data?.cast<String, dynamic>() ?? {};
    });
  }

  /// Uçuş verilerini dinle
  Stream<Map<String, dynamic>> getFlightsStream() {
    return _realtimeDb.ref(AppConstants.fbPathFlights).onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      return data?.cast<String, dynamic>() ?? {};
    });
  }

  /// Uçuş verisi güncelle (Python scripti tarafından kullanılır)
  Future<void> updateFlightStatus({
    required String flightNumber,
    required String status,
    required String estimatedTime,
    required String terminal,
  }) async {
    try {
      await _realtimeDb.ref('${AppConstants.fbPathFlights}/$flightNumber').set({
        'status': status, // "on_time" | "delayed" | "cancelled" | "landed"
        'estimated_time': estimatedTime,
        'terminal': terminal,
        'last_updated': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print('Error updating flight status: $e');
      rethrow;
    }
  }

  // =================== FIRESTORE (Kalıcı Veriler) ===================

  /// Tüm araçları getir
  Future<List<VehicleModel>> getVehicles() async {
    try {
      final snapshot = await _firestore
          .collection(AppConstants.fbPathVehiclesCollection)
          .get();
      return snapshot.docs
          .map((doc) => VehicleModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching vehicles: $e');
      rethrow;
    }
  }

  /// Tüm şoförler getir
  Future<List<DriverModel>> getDrivers() async {
    try {
      final snapshot =
          await _firestore.collection('drivers').get();
      return snapshot.docs
          .map((doc) => DriverModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching drivers: $e');
      rethrow;
    }
  }

  /// Bugünün transferlerini getir
  Future<List<TransferModel>> getTodayTransfers() async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));

      final snapshot = await _firestore
          .collection(AppConstants.fbPathTransfers)
          .where('date', isGreaterThanOrEqualTo: today)
          .where('date', isLessThan: tomorrow)
          .get();

      return snapshot.docs
          .map((doc) => TransferModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching today transfers: $e');
      rethrow;
    }
  }

  /// Transfer oluştur/güncelle
  Future<void> createTransfer(TransferModel transfer) async {
    try {
      await _firestore
          .collection(AppConstants.fbPathTransfers)
          .doc(transfer.id)
          .set(transfer.toJson());
    } catch (e) {
      print('Error creating transfer: $e');
      rethrow;
    }
  }

  /// Transfer statusunu güncelle
  Future<void> updateTransferStatus({
    required String transferId,
    required String status,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.fbPathTransfers)
          .doc(transferId)
          .update({'status': status, 'updated_at': DateTime.now()});
    } catch (e) {
      print('Error updating transfer status: $e');
      rethrow;
    }
  }

  /// Bakım logu oluştur
  Future<void> createMaintenanceLog({
    required String vehicleId,
    required String maintenanceType,
    required int kmAtMaintenance,
    required String notes,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.fbPathMaintenance)
          .add({
        'vehicle_id': vehicleId,
        'date': DateTime.now(),
        'maintenance_type': maintenanceType,
        'km_at_maintenance': kmAtMaintenance,
        'notes': notes,
        'created_at': DateTime.now(),
      });
    } catch (e) {
      print('Error creating maintenance log: $e');
      rethrow;
    }
  }

  /// Araç statusunu güncelle (maintenance, active vb)
  Future<void> updateVehicleStatus({
    required String vehicleId,
    required String status,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.fbPathVehiclesCollection)
          .doc(vehicleId)
          .update({'status': status});
    } catch (e) {
      print('Error updating vehicle status: $e');
      rethrow;
    }
  }

  /// Şoför adalet puanını güncelle
  Future<void> updateDriverEquityScore({
    required String driverId,
    required double score,
  }) async {
    try {
      await _firestore.collection('drivers').doc(driverId).update({
        'equity_score': score,
      });
    } catch (e) {
      print('Error updating driver equity score: $e');
      rethrow;
    }
  }
}
