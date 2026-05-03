#!/bin/bash
# ===============================================
# 🚀 KaplanVIP Deployment Checklist
# ===============================================
# Production deployment öncesi tüm kontrolleri yapır

set -e

echo "==============================================="
echo "🚀 KaplanVIP Deployment Pre-Check"
echo "==============================================="

# Renk kodu
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_count=0
pass_count=0
fail_count=0

# ====== FONKSIYONLAR ======

check_item() {
    local name=$1
    local command=$2
    check_count=$((check_count + 1))
    
    echo -n "[$check_count] $name... "
    
    if eval "$command" > /dev/null 2>&1; then
        echo -e "${GREEN}✓ PASS${NC}"
        pass_count=$((pass_count + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}"
        fail_count=$((fail_count + 1))
        return 1
    fi
}

# ====== KONTROLLER ======

echo ""
echo "📦 GEREKLI ARAÇLAR"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_item "Flutter SDK" "flutter --version"
check_item "Dart SDK" "dart --version"
check_item "Node.js" "node --version"
check_item "npm" "npm --version"
check_item "Firebase CLI" "firebase --version"
check_item "Python 3" "python3 --version"

echo ""
echo "📁 PRO JE DOSYALARI"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_item "pubspec.yaml" "test -f kaplan_vip/pubspec.yaml"
check_item "firebase_options.dart" "test -f kaplan_vip/lib/config/firebase_options.dart"
check_item "firestore.rules" "test -f firestore.rules"
check_item "realtime_db.rules" "test -f realtime_db.rules"
check_item "flight_scraper.py" "test -f scripts/flight_scraper.py"
check_item "GitHub Actions" "test -f .github/workflows/flight_monitor.yml"

echo ""
echo "🔐 FIREBASE CREDENTIALS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_item "Service Account Key" "test -f scripts/serviceAccountKey.json"

echo ""
echo "🔧 FLUTTER BAĞIMLILIKLARI"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_item "pubspec.lock" "test -f kaplan_vip/pubspec.lock"
check_item "Generated Models" "test -f kaplan_vip/lib/models/vehicle_model.freezed.dart"
check_item "Riverpod" "grep -q 'flutter_riverpod' kaplan_vip/pubspec.yaml"
check_item "Firebase Core" "grep -q 'firebase_core' kaplan_vip/pubspec.yaml"

echo ""
echo "✅ PYTHON BAĞIMLILIKLARI"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_item "firebase-admin" "python3 -c 'import firebase_admin'" || true
check_item "requests" "python3 -c 'import requests'" || true

echo ""
echo "📊 CÓDIGO KALITESI"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

cd kaplan_vip 2>/dev/null || { echo -e "${RED}Dizin değiştirilemiyor${NC}"; exit 1; }

# Flutter analyze
echo -n "[$(($check_count + 1))] Flutter Analyze... "
if flutter analyze --no-pub 2>&1 | grep -q "error"; then
    echo -e "${RED}✗ FAIL${NC} (Errors var)"
    fail_count=$((fail_count + 1))
else
    echo -e "${GREEN}✓ PASS${NC}"
    pass_count=$((pass_count + 1))
fi
check_count=$((check_count + 1))

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📊 SONUÇ"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Toplam Check: $check_count"
echo -e "✓ Başarılı: ${GREEN}$pass_count${NC}"
if [ $fail_count -gt 0 ]; then
    echo -e "✗ Başarısız: ${RED}$fail_count${NC}"
    echo ""
    echo -e "${YELLOW}⚠️  DEPLOYMENT İÇİN HAZıR DEĞİL${NC}"
    echo ""
    echo "Gerekli adımlar:"
    echo "1. Firebase CLI kur: npm install -g firebase-tools"
    echo "2. Python paketlerini kur: pip install firebase-admin requests"
    echo "3. pubspec.lock'u güncelle: flutter pub get"
    exit 1
else
    echo -e "✗ Başarısız: ${GREEN}0${NC}"
    echo ""
    echo -e "${GREEN}✅ DEPLOYMENT İÇİN HAZIR!${NC}"
    echo ""
    echo "Sonraki adımlar:"
    echo "1. Firebase Console'da kuralları deploy et:"
    echo "   firebase deploy --only firestore:rules"
    echo "   firebase deploy --only database"
    echo ""
    echo "2. Initial verileri yükle:"
    echo "   python3 scripts/firebase_init_data.py"
    echo ""
    echo "3. Uygulamayı çalıştır:"
    echo "   flutter run -d chrome"
    echo ""
    echo "4. GitHub'a push et (Actions otomatik çalışacak)"
    exit 0
fi
