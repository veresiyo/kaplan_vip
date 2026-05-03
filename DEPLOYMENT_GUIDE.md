# 🚀 KaplanVIP - Tam Deployment Rehberi

## 📋 Kurulum Özeti (60 dakika)

```
1. Firebase Proje Oluştur (10 dk)
   ├── Realtime Database
   ├── Firestore Database
   └── Service Account

2. Security Rules Deploy Et (10 dk)
   ├── Firestore Rules
   └── Realtime DB Rules

3. Koleksiyonları Başlat (15 dk)
   ├── drivers
   ├── vehicles_collection
   ├── transfers
   └── maintenance_logs

4. Flutter Uygulamasını Konfigüre Et (10 dk)
   ├── firebase_options.dart
   └── Python script config

5. Test Etme (15 dk)
   └── Sistem kontrolü
```

---

## ✅ 1. ADIM: Firebase Projesini Oluştur & Başlat

### A) Firebase Console Setup

```
1. https://console.firebase.google.com
2. "Yeni Proje Oluştur" → "kaplanvip-1fad8"
3. Google Analytics: KAPATIYORUZ (maliyetli)
4. Proje oluşturuldu ✅
```

### B) Realtime Database Oluştur

```
1. Firebase Console → Realtime Database
2. "Veritabanı Oluştur" butonuna tıkla
3. Ülke: Türkiye veya Avrupa (eur3)
4. Test Mode: AYARLA (Security Rules daha sonra)
5. Bağlantı URL'sini not et:
   https://kaplanvip-1fad8.firebaseio.com
```

### C) Firestore Database Oluştur

```
1. Firebase Console → Firestore Database
2. "Koleksiyon Oluştur" butonuna tıkla
3. Ülke: eur3 (Avrupa)
4. Test Mode: AYARLA
```

### D) Service Account Key İndir

```
1. Firebase Console → Proje Ayarları (⚙️)
2. Hizmet Hesapları sekmesi
3. "Yeni Özel Anahtar Oluştur" (Firebase Admin SDK)
4. JSON dosyası otomatik indir
5. Bu dosyayı saklı tut! GitHub'a ASLA push etme 🔒
   
   📁 Dosya: kaplanvip-1fad8-firebase-adminsdk-fbsvc-83be4e0ca9.json
```

---

## ✅ 2. ADIM: Security Rules Deploy Et

### A) Firestore Security Rules Deploy

```bash
# 1. Firebase CLI install et
npm install -g firebase-tools

# 2. Login yap (tarayıcı açılacak)
firebase login

# 3. Init project
cd c:\Users\halil\Desktop\FLUTTER\kaplanvip
firebase init firestore

# 4. firestore.rules dosyasını projeye kopyala
# ✅ Zaten mevcut: firestore.rules

# 5. Deploy et
firebase deploy --only firestore:rules

# ✅ Çıktı:
# ✔ Firestore Rules have been successfully deployed
```

### B) Realtime Database Security Rules Deploy

```bash
# 1. realtime_db.rules dosyasını firebase.json'a ekle:
{
  "database": {
    "rules": "realtime_db.rules"
  }
}

# 2. Deploy et
firebase deploy --only database

# ✅ Çıktı:
# ✔ Realtime Database Rules have been successfully deployed
```

### C) Tüm Kuralları Kontrol Et

```bash
# Firebase Console'da kontrol et:
1. Firestore → Rules sekmesi
   → Deployed kuralları görebilirsin
   
2. Realtime Database → Rules sekmesi
   → JSON kurallarını görebilirsin
```

---

## ✅ 3. ADIM: Firestore Koleksiyonlarını Başlat

### A) Koleksiyon Yapısı Oluştur

```
Firebase Console → Firestore Database

1. "Koleksiyon Oluştur": drivers
   ├── driver_001
   │   ├── name: "Ahmet Yılmaz"
   │   ├── phone: "5xxxxxxxxx"
   │   ├── home_location: "Konyaaltı"
   │   ├── monthly_hours_worked: 180
   │   ├── monthly_km: 2450
   │   ├── non_revenue_count: 0
   │   └── equity_score: 85.5
   └── driver_002
       └── ...

2. "Koleksiyon Oluştur": vehicles_collection
   ├── 308
   │   ├── plate: "308"
   │   ├── brand_model: "Mercedes Vito"
   │   ├── status: "active"
   │   ├── current_driver: "driver_001"
   │   ├── monthly_km: 2450
   │   ├── monthly_hours_worked: 180
   │   └── next_maintenance_km: 50000
   └── 309
       └── ...

3. "Koleksiyon Oluştur": transfers
   ├── transfer_001
   │   ├── date: 2026-05-03
   │   ├── time_start: "10:00"
   │   ├── time_end: "11:00"
   │   ├── location_from: "AYT_T1"
   │   ├── location_to: "BELEK"
   │   ├── vehicle_id: "308"
   │   ├── driver_id: "driver_001"
   │   ├── flight_number: "TK2415"
   │   ├── is_revenue: true
   │   └── status: "pending"
   └── transfer_002
       └── ...

4. "Koleksiyon Oluştur": maintenance_logs
   └── log_001
       ├── vehicle_id: "308"
       ├── date: 2026-05-03
       ├── maintenance_type: "oil"
       ├── km_at_maintenance: 45000
       └── cost: 450.50

5. "Koleksiyon Oluştur": users
   └── admin_user_001
       ├── uid: "admin_user_001"
       ├── role: "admin"
       ├── name: "Yönetici"
       └── email: "admin@kaplanvip.com
```

---

## ✅ 4. ADIM: Flutter Uygulamasını Konfigüre Et

### A) Firebase Options Güncelle ✅ (Zaten yapılmış)

```bash
# Dosya: lib/config/firebase_options.dart
# ✅ Gerçek credentials ile doldurulmuş:
# - projectId: kaplanvip-1fad8
# - databaseURL: https://kaplanvip-1fad8.firebaseio.com
```

### B) Service Account Key'i Python Script'e Kopyala

```bash
# 1. Service account JSON'ı indir
#    Dosya: kaplanvip-1fad8-firebase-adminsdk-fbsvc-83be4e0ca9.json

# 2. Scripts klasörüne kopyala
cp "C:\Users\halil\Downloads\kaplanvip-1fad8-firebase-adminsdk-fbsvc-83be4e0ca9.json" \
   "c:\Users\halil\Desktop\FLUTTER\kaplanvip\scripts\serviceAccountKey.json"

# 3. Flutter'dan test et
cd c:\Users\halil\Desktop\FLUTTER\kaplanvip\kaplan_vip
flutter pub get
dart run build_runner build

# 4. Çalıştır
flutter run -d chrome
```

### C) GitHub Actions Secrets Ekle (Production Deploy için)

```bash
# 1. GitHub repo → Settings → Secrets and variables → Actions

# 2. "New repository secret" ekle:
Name: FIREBASE_SERVICE_ACCOUNT
Value: 
{
  "type": "service_account",
  "project_id": "kaplanvip-1fad8",
  ...
  (Tüm JSON içeriğini kopyala)
}

# 3. Kaydet ve push et
git add .github/workflows/flight_monitor.yml
git commit -m "Add GitHub Actions automation"
git push

# ✅ Artık her 5 dakikada otomatik çalışacak!
```

---

## ✅ 5. ADIM: Test Etme & Doğrulama

### A) Flutter Uygulamasını Test Et

```bash
# Terminal 1: Flutter app
cd kaplan_vip
flutter run -d chrome

# Browser açılacak ve şu görülür:
# ✅ Tab 1 - Harita: Araç konumları (simüle)
# ✅ Tab 2 - İşler: Transfer listesi
# ✅ Tab 3 - Uyarılar: Rötar yapan uçuşlar
# ✅ Tab 4 - Öneriler: Alternatif atamalar
```

### B) Python Flight Scraper'ı Test Et

```bash
# Terminal 2: Python script
cd scripts

# Gerekli paketleri kur
pip install firebase-admin

# Tek seferlik test
python flight_scraper.py --once

# Çıktı örneği:
# ✓ Firebase bağlantısı başarılı
# ✓ live_flights/{flightNumber} güncellendi
# [2026-05-03 14:30] TK2415: on_time (T1)
# [2026-05-03 14:30] SU2148: delayed (T2) ⚠
```

### C) Firebase Realtime Database'i Kontrol Et

```
1. Firebase Console → Realtime Database
2. live_data/vehicles → Konumlar görünür ✅
3. live_flights → Uçuş verileri görünür ✅
```

### D) GitHub Actions Test Et

```bash
# 1. GitHub → Actions sekmesi
# 2. "Flight Status Monitor" workflow'unu görüntüle
# 3. "Run workflow" → "Run workflow" butonuna tıkla
# 4. Workflow run görülecek ve başarılı bitecek ✅
```

---

## 📊 Adalet Algoritmasını Test Et

### A) Manual Test

```dart
// Flutter DevTools → Dart DevTools → Console
// Şu kodu çalıştır:

final assignments = await assignmentEngine.suggestBestAssignments(
  vehicles: vehicles,
  drivers: drivers,
  transfer: Transfer(...),
  vehicleDailyJobCount: {'308': 2, '309': 1},
);

// Çıktı: Top 3 araç önerisi (equity score sıralı)
// ✅ 308 - Ahmet Yılmaz (score: 85.3) - Bugün 2 iş, aylık saat az
// ✅ 309 - Mehmet Koç (score: 87.1) - Bugün 1 iş
// ✅ 310 - Can Yelkovan (score: 91.5) - Bugün 3 iş
```

---

## 🔐 Security & Best Practices

### A) Security Checklist

```
✅ Service Account Key:
   - Güvenli saklanmalı (GitHub Secrets)
   - Production'da rotation yapılmalı (3 ayda bir)
   - Asla client code'a hardcode edilmemeli

✅ Firestore Security Rules:
   - Test Mode'dan Production'a geçilmeli
   - Authentication enforce edilmeli
   - Role-based access control kurulmalı

✅ KVKK Uyumluluğu:
   - Telefon numaraları AES-256 şifreli
   - Passenger codes kullanılmalı (numara değil)
   - Tüm API'ler HTTPS üzerinde
```

### B) Backup Strategy

```bash
# Firebase Firestore backup
firebase firestore:delete collections --all
firebase firestore:restore backup_dir

# Realtime Database export
firebase database:get / > backup.json
```

---

## 🚨 Troubleshooting

### Problem: "Firebase bağlantısı başarısız"

```
Çözüm:
1. firebase_options.dart'ta projectId kontrol et
2. Google Cloud Console'da API enabled mi?
3. Firewall/VPN problemi var mı?
```

### Problem: "Security Rules hataları"

```
Çözüm:
1. Firebase Console → Security Rules → Test kuralları
2. Validation errors kontrol et
3. Rules syntax'ı kontrol et (JSON)
```

### Problem: "Python scraper çalışmıyor"

```
Çözüm:
1. serviceAccountKey.json mevcut mu?
2. pip packages: firebase-admin, requests
3. Logs kontrol et: flight_scraper.py debug output
```

### Problem: "Flutter app'i Firebase'e bağlanamıyor"

```
Çözüm:
1. flutter clean
2. flutter pub get
3. dart run build_runner build --delete-conflicting-outputs
4. Android/iOS build cache temizle
5. Emülatörü yeniden başlat
```

---

## 📈 Performance Optimization

### A) Firebase Read/Write Optimization

```
✅ Realtime DB Yazma:
   - Threshold filtering: 50m mesafe veya 3+ dakika
   - Bandwidth: ~8KB/month per vehicle
   
✅ Firestore Queries:
   - Indexes oluştur (composite queries için)
   - Pagination implement et (transfer listesi)
   - Caching aktif et (offline persistency)

✅ Cost:
   - Spark Plan: Free (50K reads/day, 20K writes/day)
   - Tahmin: 10 araç × 288 location updates/day = 2880 writes/day
   - Hepsi free tier içinde ✅
```

---

## 🎯 Production Deployment Checklist

```
PRE-DEPLOYMENT:
☐ Security Rules test edilmiş (Production rules)
☐ Firestore indexes oluşturulmuş
☐ Service account key rotasyonu planned
☐ Backup strategy implemented
☐ Monitoring setup (Cloud Logging)
☐ Error tracking setup (Sentry/Firebase Crashlytics)

DEPLOYMENT:
☐ firestore:rules deploy
☐ database:rules deploy
☐ GitHub Actions secrets verify
☐ Pilot users ile test (1-2 gün)
☐ Performance monitoring aktif
☐ On-call support ready

POST-DEPLOYMENT:
☐ 7 gün monitoring
☐ Performance metrics analysis
☐ User feedback collection
☐ Bug fixes deployed
☐ Documentation updated
```

---

## 📞 Sonraki Adımlar

```
1 ✅ Firebase setup tamamlandı
2 ✅ Security Rules deployed
3 ✅ Flutter uygulaması çalışıyor
4 ⏭️ Python scraper production'a geçti
5 ⏭️ Admin dashboard (sonrası)
6 ⏭️ Şoför mobil app (sonrası)
7 ⏭️ Analytics & Reporting (sonrası)
```

---

**Hayırlı çalışmalar! 🚀**

Sorunla karşılaşırsan: troubleshooting section'ı kontrol et veya GitHub Issues'a yaz.
