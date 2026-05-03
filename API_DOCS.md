# KaplanVIP API Dokümantasyonu

## 📡 Firebase Realtime Database Endpoints

### 🚗 Araç Konumları
```
Path: live_data/vehicles/{vehicleId}

GET /vehicles/{vehicleId}
Response:
{
  "latitude": 36.8969,
  "longitude": 30.7133,
  "status": "with_passenger|idle|en_route|maintenance",
  "last_updated": 1715046000
}

PUT /vehicles/{vehicleId}
Request:
{
  "latitude": 36.8969,
  "longitude": 30.7133,
  "status": "with_passenger",
  "last_updated": 1715046000
}
```

### ✈️ Uçuş Durumları
```
Path: live_flights/{flightNumber}

GET /live_flights/{flightNumber}
Response:
{
  "status": "on_time|delayed|landed|cancelled",
  "original_time": "10:00",
  "new_time": "10:35",
  "terminal": "T1|T2|CIP",
  "last_updated": 1715046000
}

PUT /live_flights/{flightNumber}
Request:
{
  "status": "delayed",
  "estimated_time": "10:35",
  "terminal": "T1",
  "last_updated": 1715046000
}
```

## 📚 Firebase Firestore Collections

### 👨‍💼 Drivers Collection
```
Collection: drivers
Document ID: {driverId}

Fields:
{
  "name": "Ahmet Yilmaz",
  "phone": "5xxxxxxxxx",  // AES-256 Encrypted
  "home_latitude": 36.8891,
  "home_longitude": 30.6948,
  "home_location": "Konyaaltı",
  "license_number": "ABC123456",
  "monthly_hours_worked": 180,
  "monthly_km": 2450,
  "non_revenue_count": 2,
  "equity_score": 87.3,
  "created_at": Timestamp("2026-04-01T00:00:00Z")
}
```

### 🚙 Vehicles Collection
```
Collection: vehicles_collection
Document ID: {vehicleId}

Fields:
{
  "plate": "308",
  "brand_model": "Mercedes Vito",
  "status": "active|maintenance|retired",
  "current_driver": "driver_001",  // Reference to drivers/{driverId}
  "daily_job_count": 4,
  "monthly_hours_worked": 180,
  "monthly_km": 2450,
  "last_maintenance_date": Timestamp("2026-04-20T00:00:00Z"),
  "last_maintenance_km": 45000,
  "next_maintenance_km": 50000
}
```

### 📋 Transfers Collection
```
Collection: transfers
Document ID: {transferId}

Fields:
{
  "date": Timestamp("2026-05-03T00:00:00Z"),
  "time_start": "10:00",
  "time_end": "11:00",
  "location_from": "AYT_T1",    // Enum: AYT_T1, AYT_T2, AYT_CIP, BELEK, KEMER
  "location_to": "BELEK",
  "vehicle_id": "308",          // Reference
  "driver_id": "driver_001",    // Reference
  "passenger_code": "CODE_2026_001",  // Encrypted
  "flight_number": "TK2415",
  "flight_type": "domestic|international|charter",
  "is_revenue": true,
  "estimated_km": 50,
  "status": "pending|assigned|completed|cancelled",
  "notes": "VIP transfer - 3 passengers",
  "created_at": Timestamp("2026-05-02T15:30:00Z"),
  "updated_at": Timestamp("2026-05-03T08:00:00Z")
}
```

### 🔧 Maintenance Logs Collection
```
Collection: maintenance_logs
Document ID: {logId}

Fields:
{
  "vehicle_id": "308",         // Reference
  "date": Timestamp("2026-05-03T00:00:00Z"),
  "maintenance_type": "oil|tire|inspection|repair|other",
  "km_at_maintenance": 45000,
  "notes": "Yağ değişimi ve filtre temizliği",
  "cost": 450.50,
  "created_at": Timestamp("2026-05-03T10:00:00Z")
}
```

## 🎯 REST API Örnekleri (Firebase Cloud Functions)

### Atama Önerisi Al
```
POST /api/assignment/suggest
Content-Type: application/json

Request:
{
  "transfer_id": "transfer_001",
  "limit": 3
}

Response:
{
  "suggestions": [
    {
      "vehicle_id": "308",
      "driver_id": "driver_001",
      "vehicle_plate": "308",
      "driver_name": "Ahmet Yilmaz",
      "match_score": 95.2,
      "reason": "Bugün az iş yaptı (2 iş), evi işe 15km yakın, adalet puanı düşük",
      "location_distance": 15.3,
      "daily_job_count": 2,
      "equity_score": 87.3
    },
    ...
  ]
}
```

### Transfer Ata
```
POST /api/assignment/assign
Content-Type: application/json

Request:
{
  "transfer_id": "transfer_001",
  "vehicle_id": "308",
  "driver_id": "driver_001"
}

Response:
{
  "success": true,
  "message": "Transfer başarıyla atandı",
  "transfer_id": "transfer_001",
  "assigned_at": "2026-05-03T08:15:30Z"
}
```

### Uçuş Durumunu Güncelle
```
PUT /api/flights/update
Content-Type: application/json

Request:
{
  "flight_number": "TK2415",
  "status": "delayed",
  "estimated_time": "10:35",
  "terminal": "T1"
}

Response:
{
  "success": true,
  "message": "Uçuş durumu güncellendi",
  "flight": {
    "flight_number": "TK2415",
    "status": "delayed",
    "estimated_time": "10:35",
    "updated_at": "2026-05-03T08:20:00Z"
  }
}
```

### Araç Konumunu Güncelle
```
PUT /api/vehicles/{vehicleId}/location
Content-Type: application/json

Request:
{
  "latitude": 36.8975,
  "longitude": 30.7140,
  "status": "with_passenger"
}

Response:
{
  "success": true,
  "message": "Konum güncellendi",
  "vehicle_id": "308",
  "updated_at": "2026-05-03T08:25:15Z"
}
```

## 🔒 Authentication & Security

### Firebase Security Rules (Realtime DB)
```json
{
  "rules": {
    "live_data": {
      ".read": "auth != null && root.child('users').child(auth.uid).child('role').val() == 'driver'",
      ".write": "auth != null && root.child('users').child(auth.uid).child('role').val() == 'driver'"
    },
    "live_flights": {
      ".read": true,
      ".write": "auth != null && root.child('users').child(auth.uid).child('role').val() == 'admin'"
    }
  }
}
```

### KVKK Compliance
- Tüm telefon numaraları AES-256 şifreli tutulur
- Şoför adları ve kişi bilgileri log'lara yazılmaz
- API response'larında `passenger_code` kullanılır (numara değil)
- Tüm veriler SSL/HTTPS üzerinden transfer edilir

## 📊 Veri Modelleri

### EquityScore Hesaplama
```
EquityScore = 
  (aylık_saatler * 1.0 + 
   aylık_km * 0.01 + 
   kazançsız_iş_sayısı * 2.0) / 
  gün_sayısı 
  - bugün_iş_sayısı * 0.5 
  + lokasyon_efisiyansı * 0.3

Düşük Skor = Daha Uygun = Daha Fazla İş Alma Hakkı
```

### Conflict Detection (Ripple Effect)
```
Rötar algılanırsa:
1. O aracın bir sonraki işi kontrol et
2. Rötar + transfer süresi = varış zamanını hesapla
3. Eğer varış zamanı > sonraki işin başlangıç zamanı
   → KIRMIZI UYARI + Alternatif öner
```

## 🔄 Polling & Real-time Updates

### Flutter StreamBuilder Pattern
```dart
StreamBuilder<Map<String, dynamic>>(
  stream: ref.watch(vehiclesStreamProvider).whenData((vehicles) => vehicles),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final vehicles = snapshot.data!;
      // UI update
    }
  }
)
```

### Python Scraper Polling
```python
# Her 5 dakikada bir çalışır (GitHub Actions)
schedule.every(5).minutes.do(update_firebase)

# Firebase'e yazıldığında Flutter otomatik Listener tetiklenir
db.ref('live_flights').on_value(callback=handle_update)
```

## 📈 Rate Limiting & Quotas

| Operasyon | Limit | Süre |
|-----------|-------|------|
| Vehicle Location Update | 50 per minute | Per vehicle |
| Flight Status Update | 100 per minute | Global |
| Transfer Assignment | 1000 per day | Global |
| Firestore Read | 50,000 | Per day (Spark plan) |
| Realtime DB Write | 100 | Per second |

---

**Son Güncelleme:** 3 Mayıs 2026
