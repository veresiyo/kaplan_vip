class AppConstants {
  // Buffer Times (Dakika cinsinden)
  static const int domesticFlightBuffer = 45;
  static const int internationalFlightBuffer = 60;
  static const int cipFlightBuffer = 50;
  static const int familyBufferExtra = 20;
  static const int charterBufferExtra = 30;

  // Estimated Distances (KM)
  static const int airportToBelek = 50;
  static const int airportToKemer = 65;
  static const int belekToKemer = 30;

  // Equity Score Settings
  static const double hourWeight = 1.0;
  static const double kmWeight = 0.01;
  static const double nonRevenueWeight = 2.0;
  static const double todayJobCountPenalty = 0.5;
  static const double locationEfficiencyBonus = 0.3;

  // Location Threshold
  static const double locationThresholdMeters = 50;
  static const int locationUpdateIntervalSeconds = 60;

  // Batch Size
  static const int maxSuggestedAlternatives = 3;

  // Status Constants
  static const String statusActive = 'active';
  static const String statusMaintenance = 'maintenance';
  static const String statusRetired = 'retired';

  // Transfer Status
  static const String transferStatusPending = 'pending';
  static const String transferStatusAssigned = 'assigned';
  static const String transferStatusCompleted = 'completed';
  static const String transferStatusCancelled = 'cancelled';

  // Vehicle Status
  static const String vehicleStatusIdle = 'idle';
  static const String vehicleStatusWithPassenger = 'with_passenger';
  static const String vehicleStatusEnRoute = 'en_route';
  static const String vehicleStatusMaintenance = 'maintenance';

  // Maintenance Types
  static const String maintenanceTypeOil = 'oil';
  static const String maintenanceTypeTire = 'tire';
  static const String maintenanceTypeInspection = 'inspection';
  static const String maintenanceTypeRepair = 'repair';
  static const String maintenanceTypeOther = 'other';

  // Firebase Paths
  static const String fbPathLiveData = 'live_data';
  static const String fbPathVehicles = 'live_data/vehicles';
  static const String fbPathFlights = 'live_flights';
  static const String fbPathTransfers = 'transfers';
  static const String fbPathDrivers = 'drivers';
  static const String fbPathVehiclesCollection = 'vehicles_collection';
  static const String fbPathMaintenance = 'maintenance_logs';
}
