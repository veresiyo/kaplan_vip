# KaplanVIP Transfer Management System

Antalya'da lüks transfer operasyonları için yapay zeka destekli, profesyonel VIP taşıma yönetim sistemi.

## ✨ Özellikler

### 🎯 Adil İş Dağılımı (Equity Algorithm)
- Şoförlerin aylık toplam saati, kilometresi ve kazançsız (personel/bagaj) transferleri baz alarak otomatik dağılım
- Günlük iş yükü göz önüne alıp "yorgun" araçlara az iş atama
- Ev konumlarına yakın işlerin atanması (yakıt tasarrufu)

### 📍 Reel-Time Takip
- Firebase Realtime Database ile canlı araç konumları
- Şoför GPS'i sadece hareket ettiğinde güncellenir (batarya tasarrufu)
- OpenStreetMap tabanlı harita (Google Maps API ücretiyle yüklenmez)

### ✈️ Uçuş Monitörizasyonu
- GitHub Actions üzerinde her 5 dakikada bir uçuş verisi güncellenmesi
- Rötar algılanırsa kritik uyarı
- Dinamik zaman tamponları (İç/Dış hatlar, aileler, grup uçuşları)

### 🚨 Kritik Durum Yönetimi
- Araç arızası veya rötar durumunda otomatik 3 alternatif öneri
- Yönetici onayı şart (otonom atama yapılmaz)
- KVKK uyumlu (misafir numaraları asla paylaşılmaz)

### 🔧 Bakım Modülü
- Araç bakım takibi (ayrı departman erişimi)
- Bakımdaki araçlar otomatik operasyondan çıkarılır
- Periyodik bakım hatırlatmaları

### 📊 Responsive UI
- Mobile, Tablet ve Web'de sorunsuz çalışma
- Taşma hatası yok (Flexible, Expanded, LayoutBuilder kullanımı)
- Riverpod State Management ile temiz mimari

## 🛠️ Teknoloji Stack

### Frontend
- **Flutter 3.x** - Cross-platform mobile/web UI
- **Riverpod** - State Management
- **Freezed** - Immutable models
- **flutter_map** - OpenStreetMap harita entegrasyonu

### Backend
- **Firebase Realtime Database** - Canlı araç konumları (~8KB/ay maliyet)
- **Firebase Firestore** - Kalıcı veriler (araçlar, şoförler, transfer geçmişi)
- **Python 3.9+** - Flight scraper script
- **GitHub Actions** - Otomatik 5 dakikalık görev çalıştırıcı

### Veritabanı
```
Realtime Database (live_data/):
  vehicles/{vehicleId}:
    - latitude, longitude, status, last_updated
  
  live_flights/{flightNumber}:
    - status, estimated_time, terminal, last_updated

Firestore Collections:
  drivers/ - Şoför bilgileri
  vehicles_collection/ - Araç metadata
  transfers/ - Transfer kayıtları
  maintenance_logs/ - Bakım geçmişi
```

## 🚀 Başlangıç

### Gereksinimler
- Flutter 3.11+ 
- Python 3.9+
- Firebase projesi (Spark Plan ücretsiz)

### Kurulum

1. **Flutter projesini klon ve hazırla:**
```bash
cd kaplan_vip
flutter pub get
dart run build_runner build
```

2. **Firebase projesi oluştur:**
   - https://console.firebase.google.com adresine git
   - Yeni proje oluştur (isminde "kaplan-vip" olsun)
   - Realtime Database oluştur (Test Mode ile başla)
   - Firestore Database oluştur
   - Service Account key indir (serviceAccountKey.json)

3. **Firebase credentials güncelle:**
```dart
// lib/config/firebase_options.dart
// Google-services.json veya serviceAccountKey.json'dan değerleri al
```

4. **Python dependencies yükle:**
```bash
pip install firebase-admin requests
```

5. **GitHub Actions setup (Production):**
   - GitHub repo ayarlarına git → Secrets
   - `FIREBASE_SERVICE_ACCOUNT` isminde yeni secret ekle
   - serviceAccountKey.json dosyasının JSON içeriğini yapıştır

6. **Uygulamayı çalıştır:**
```bash
flutter run -d chrome  # Web
flutter run -d android # Android emülatör
```

## 📱 Ekran Yapısı

```
OperationsHomePage (Tabjı 4 sekme)
├── Tab 1: Live Map 
│   └── Flutter Map + Araç markerları (yeşil/sarı/kırmızı)
├── Tab 2: Transfers Today
│   └── Bugünün transfer listesi + durum
├── Tab 3: Critical Alerts
│   └── Rötar ve arıza uyarıları
└── Tab 4: Suggestions
    └── Atama önerileri (Adalet Algoritması sonuçları)

MaintenancePage (Ayrı tab)
├── Vehicle List
├── Maintenance History
└── Maintenance Form
```

## 🔐 KVKK & Güvenlik

✅ **Uyumlu:**
- Misafir telefon numaraları asla frontend'e iletilmez
- Tüm iletişim anonymized (CODE_2024_001 gibi)
- Firebase Security Rules ile erişim kontolü
- API key'ler environment variables'da

❌ **YAPILMAYACAK:**
- Kullanıcı verilerinin 3. taraflarla paylaşılması
- Şifreli olmayan veri depolama
- Client-side'da API key'leri hardcode etme

## 💰 Maliyet Tahmini

| Servis | Aylık Maliyet |
|--------|---------------|
| Firebase Realtime DB (8KB/ay) | Bedava* |
| Firebase Firestore (10K yazma) | Bedava* |
| OpenStreetMap Tiles | Bedava |
| GitHub Actions (Free tier) | Bedava |
| **TOPLAM** | **~0 TL** |

*Spark Plan ücretsiz kotaları yeterliyse

## 📊 Atama Algoritması (Equity Score)

```
EquityScore = 
  (Aylık_Saatler * 1.0 + Aylık_KM * 0.01 + Kazançsız_İş * 2.0) / Gün_Sayısı
  - Bugün_İş_Sayısı * 0.5
  + Lokasyon_Efisiyansı * 0.3

Düşük Skor = Daha Uygun = Atama Önceliği
```

## 🐛 Gelişim Planı

- [ ] Google Maps API entegrasyonu (opsiyonel)
- [ ] Şoför performans skalası
- [ ] SMS/WhatsApp bildirimleri
- [ ] Veritabanı raporları (PDF export)
- [ ] Multi-language desteği (TR/EN)

## 📞 İletişim & Destek

Sistem hakkında sorular için:
- 📧 Email: tech@kaplanvip.com
- 💬 Slack: #transfer-system

## 📄 Lisans

Tüm hakları saklıdır © 2026 KaplanVIP

---

**v1.0.0 - 3 Mayıs 2026**
