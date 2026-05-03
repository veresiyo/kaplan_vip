#!/bin/bash
# KaplanVIP Setup Verification Script
# Bu script, sistemin düzgün kurulup kurulmadığını kontrol eder

echo "🔍 KaplanVIP Transfer Management System - Setup Verification"
echo "=============================================================="
echo ""

# 1. Flutter Check
echo "📱 Flutter Sürümü:"
flutter --version 2>/dev/null && echo "✓ Flutter yüklü" || echo "✗ Flutter yüklü değil"
echo ""

# 2. Dart Check
echo "🎯 Dart Sürümü:"
dart --version 2>/dev/null && echo "✓ Dart yüklü" || echo "✗ Dart yüklü değil"
echo ""

# 3. Project Structure Check
echo "📁 Proje Yapısı Kontrolü:"
directories=(
    "lib/config"
    "lib/core/constants"
    "lib/models"
    "lib/services"
    "lib/providers"
    "lib/features/operations/pages"
    "lib/features/operations/widgets"
    "lib/features/maintenance/pages"
    "scripts"
    ".github/workflows"
)

for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "✓ $dir"
    else
        echo "✗ $dir YOK!"
    fi
done
echo ""

# 4. Key Files Check
echo "📄 Ana Dosyalar:"
files=(
    "pubspec.yaml"
    "lib/main.dart"
    "lib/config/firebase_options.dart"
    "lib/services/firebase_service.dart"
    "lib/services/assignment_engine.dart"
    "scripts/flight_scraper.py"
    ".github/workflows/flight_monitor.yml"
    "README_TR.md"
    "QUICKSTART.md"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
    else
        echo "✗ $file YOK!"
    fi
done
echo ""

# 5. Dependencies Check
echo "📦 Bağımlılıklar (pubspec.yaml):"
if grep -q "flutter_riverpod" pubspec.yaml; then
    echo "✓ flutter_riverpod"
else
    echo "✗ flutter_riverpod YOK!"
fi

if grep -q "firebase_core" pubspec.yaml; then
    echo "✓ firebase_core"
else
    echo "✗ firebase_core YOK!"
fi

if grep -q "freezed_annotation" pubspec.yaml; then
    echo "✓ freezed_annotation"
else
    echo "✗ freezed_annotation YOK!"
fi

if grep -q "flutter_map" pubspec.yaml; then
    echo "✓ flutter_map"
else
    echo "✗ flutter_map YOK!"
fi
echo ""

# 6. Python Check
echo "🐍 Python Kontrol:"
python3 --version 2>/dev/null && echo "✓ Python yüklü" || echo "✗ Python yüklü değil"

if python3 -c "import firebase_admin" 2>/dev/null; then
    echo "✓ firebase-admin paketi"
else
    echo "⚠ firebase-admin paketi yüklü değil (python scripts/flight_scraper.py için gerekli)"
fi
echo ""

# 7. Firebase Config Check
echo "🔥 Firebase Konfigürasyonu:"
if [ -f "lib/config/firebase_options.dart" ]; then
    if grep -q "YOUR_API_KEY_HERE" lib/config/firebase_options.dart; then
        echo "⚠ Firebase credentials henüz girilmemiş (QUICKSTART.md takip et)"
    else
        echo "✓ Firebase credentials girilmiş"
    fi
else
    echo "✗ firebase_options.dart dosyası yok!"
fi
echo ""

# 8. Generated Files Check
echo "🔧 Code Generation Kontrolü:"
if [ -f "lib/models/vehicle_model.freezed.dart" ]; then
    echo "✓ Freezed models generate edilmiş"
else
    echo "⚠ Freezed models henüz generate edilmemiş (dart run build_runner build)"
fi
echo ""

# 9. Analysis Check
echo "🔍 Kod Analizi (flutter analyze):"
flutter analyze --no-pub 2>&1 | tail -1
echo ""

# Summary
echo "=============================================================="
echo "✅ Tüm kontroller tamamlandı!"
echo ""
echo "Sonraki Adımlar:"
echo "1. Firebase projesi oluştur: https://console.firebase.google.com"
echo "2. firebase_options.dart'ı güncelle (QUICKSTART.md takip et)"
echo "3. flutter run -d chrome komutu ile çalıştır"
echo ""
