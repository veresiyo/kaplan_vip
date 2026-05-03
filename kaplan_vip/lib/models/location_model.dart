import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String id,
    required String name, // "Havalimanı T1" | "Belek" | "Kemer" vb
    required double latitude,
    required double longitude,
    required String type, // "airport" | "hotel" | "home" | "terminal"
    required String terminal, // "T1" | "T2" | "CIP" | "" (varsa)
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}

// Sabit lokasyonlar
class AppLocations {
  static const LocationModel aytTerminal1 = LocationModel(
    id: 'AYT_T1',
    name: 'Antalya Havalimanı Terminal 1',
    latitude: 36.8969,
    longitude: 30.7133,
    type: 'terminal',
    terminal: 'T1',
  );

  static const LocationModel aytTerminal2 = LocationModel(
    id: 'AYT_T2',
    name: 'Antalya Havalimanı Terminal 2',
    latitude: 36.8969,
    longitude: 30.7133,
    type: 'terminal',
    terminal: 'T2',
  );

  static const LocationModel aytCIP = LocationModel(
    id: 'AYT_CIP',
    name: 'Antalya Havalimanı CIP',
    latitude: 36.8969,
    longitude: 30.7133,
    type: 'terminal',
    terminal: 'CIP',
  );

  static const LocationModel maxxBelek = LocationModel(
    id: 'BELEK',
    name: 'MAXX Belek Resort',
    latitude: 36.7854,
    longitude: 31.2434,
    type: 'hotel',
    terminal: '',
  );

  static const LocationModel maxxKemer = LocationModel(
    id: 'KEMER',
    name: 'MAXX Kemer Resort',
    latitude: 36.6053,
    longitude: 30.5707,
    type: 'hotel',
    terminal: '',
  );
}
