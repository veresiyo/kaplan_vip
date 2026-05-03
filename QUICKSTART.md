# 🚀 KaplanVIP - Hızlı Başlangıç Rehberi

## 📋 Adım Adım Kurulum (30 dakika)

### 1️⃣ Firebase Projesi Oluştur

1. https://console.firebase.google.com adresine git
2. **"Yeni Proje Oluştur"** butonuna tıkla
3. Proje adı: `kaplan-vip-project`
4. Google Analytics: İstemiyorsan kapat
5. **Realtime Database oluştur:**
   - Veritabanı seç → Test Mode
   - Location: `eur3` (Avrupa)
6. **Firestore Database oluştur:**
   - Test Mode
   - Location: `eur3`

### 2️⃣ Service Account Anahtarı İndir

1. Proje Ayarları → Hizmet Hesapları
2. **"Yeni Özel Anahtar Oluştur"** (Firebase Admin SDK)
3. JSON dosyası indir: `serviceAccountKey.json`
4. Dosyayı güvenli yere kaydet

### 3️⃣ Firebase Seçeneklerini Güncelle

`lib/config/firebase_options.dart` açı:
```dart
// serviceAccountKey.json'dan şu değerleri kopyala:
apiKey: "YOUR_API_KEY",  // web -> apiKey
appId: "YOUR_APP_ID",     // Android -> appId
messagingSenderId: "YOUR_SENDER_ID",  // projectNumber
projectId: "kaplan-vip-project",
databaseURL: "https://kaplan-vip-project.firebaseio.com",
storageBucket: "kaplan-vip-project.appspot.com",
```

### 4️⃣ Flutter Uygulamasını Çalıştır

```bash
cd kaplan_vip

# Paketleri yükle
flutter pub get

# Build runner (Models için)
dart run build_runner build

# Web'de çalıştır (en kolay)
flutter run -d chrome

# veya Android emülatörde
flutter emulators launch Pixel_5
flutter run -d emulator-5554
```

### 5️⃣ Python Flight Scraper'ı Ayarla (Opsiyonel)

```bash
# Gerekli paketler
pip install firebase-admin requests

# Test çalıştırması
python scripts/flight_scraper.py --once

# Sürekli çalıştırma (5 dakika aralığında)
python scripts/flight_scraper.py
```

### 6️⃣ GitHub Actions Setup (Production için)

1. GitHub repo ayarlarına git
2. **Secrets and variables** → **Actions**
3. **"New repository secret"** ekle:
   - Name: `FIREBASE_SERVICE_ACCOUNT`
   - Value: `serviceAccountKey.json` içeriğini yapıştır (JSON string)

4. `.github/workflows/flight_monitor.yml` pushen sonra:
   - GitHub Actions otomatik her 5 dakikada çalışır

## 🧪 Test Etme

### Operasyon Ekranında Veri Gör:

1. **Tab 1 - Harita:** 
   - Araç konumları marker olarak görünür (simüle edilmiş veri)

2. **Tab 2 - İşler:**
   - Bugünün transfer listesi gösterilir

3. **Tab 3 - Uyarılar:**
   - Rötar yapan uçuşlar kırmızı renkle
   - Uçuş "delayed" ise ⚠️ işareti

4. **Tab 4 - Öneriler:**
   - Bir transfer tıklandığında algoritma 3 alternatif önerir

### Firebase Realtime Database'i Kontrol Et:

```
https://console.firebase.google.com
  → kaplan-vip-project
  → Realtime Database
  → live_data/vehicles
  → (araç konumları gösterilir)
  
  → live_flights
  → (uçuş verileri gösterilir)
```

### Python Scraper'ı Test Et:

```bash
cd scripts
python flight_scraper.py --once

# Çıktı:
# ✓ Firebase bağlantısı başarılı
# [2026-05-03 14:30:45] ✓ Firebase güncellendi
#    Uçuş sayısı: 4
#    → TK2415: on_time - Terminal T1
#    ⚠ SU2148: delayed - Terminal T2
```

## 📊 Veritabanı İlk Verileri

### 1. Araç Bilgileri (Firestore - vehicles_collection)

```json
{
  "plate": "308",
  "brand_model": "Mercedes Vito",
  "status": "active",
  "current_driver": "driver_001",
  "monthly_km": 2450,
  "monthly_hours_worked": 180,
  "last_maintenance_date": "2026-04-20",
  "last_maintenance_km": 45000,
  "next_maintenance_km": 50000
}
```

### 2. Şoför Bilgileri (Firestore - drivers)

```json
{
  "name": "Ahmet Yilmaz",
  "phone": "5XXXXXXXXX",  // Şifreli
  "home_location": "Konyaaltı",
  "home_latitude": 36.8891,
  "home_longitude": 30.6948,
  "monthly_hours_worked": 180,
  "monthly_km": 2450,
  "non_revenue_count": 2,
  "equity_score": 87.3
}
```

### 3. Transfer Programı (Firestore - transfers)

```json
{
  "date": "2026-05-03",
  "time_start": "10:00",
  "time_end": "11:00",
  "location_from": "AYT_T1",
  "location_to": "BELEK",
  "vehicle_id": "308",
  "driver_id": "driver_001",
  "passenger_code": "CODE_2026_001",
  "flight_number": "TK2415",
  "flight_type": "domestic",
  "is_revenue": true,
  "status": "assigned"
}
```

İlk verileri Firestore konsolundan manuel olarak ekleyebilirsin veya bir batch import script yazabilirsin.

## 🐛 Sık Sorulan Sorunlar

### "Firebase bağlantısı başarısız"
```
→ serviceAccountKey.json dosyasının doğru yolu kontrol et
→ Firebase credentials'ı firebase_options.dart'ta güncelle
```

### "Realtime Database'de veri gözükmüyor"
```
→ flutter_riverpod'in StreamProvider'ını kontrol et
→ Firebase Security Rules'ı test için aç:
   {
     "rules": {
       ".read": true,
       ".write": true
     }
   }
```

### "Python scripti çalışmıyor"
```
→ pip install firebase-admin
→ serviceAccountKey.json dosyasının scripts/ klasöründe olduğunu kontrol et
```

## 🎯 Sonraki Adımlar

✅ Temel sistem kuruldu
⏭️ **Sonra yapılacaklar:**
1. Excel takvimini CSV olarak dışa aktar ve sisteme yükle
2. Araç ve şoför bilgilerini Firestore'a ekle
3. Canlı test yaparak algoritma doğruluğunu kontrol et
4. Google Maps navigasyon entegrasyonunu (opsiyonel) ekle
5. Şoför mobil uygulaması (Android/iOS) hazırlığı

## 📞 Destek

Sorunla karşılaşırsan:
1. `flutter analyze` çalıştır
2. `Flutter DevTools` aç (dart devtools)
3. Firebase Console'da Security Rules ve Realtime DB durumunu kontrol et
4. Kodun başında `logger` paketi kullanarak debug et

---

**Hayırlı olsun! 🎉**
