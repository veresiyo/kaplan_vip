#!/usr/bin/env python3
"""
🔥 Firebase Initial Data Setup Script
=====================================
Firestore koleksiyonlarına initial test verilerini yükler.

Kullanım:
  python scripts/firebase_init_data.py
"""

import firebase_admin
from firebase_admin import credentials, firestore
import json
from datetime import datetime
import sys

# Firebase Service Account Key Path
import os
SERVICE_ACCOUNT_KEY = 'scripts/serviceAccountKey.json'

def init_firebase():
    """Firebase'i initialize et"""
    try:
        # Dosya var mı kontrol et
        if not os.path.exists(SERVICE_ACCOUNT_KEY):
            print(f"❌ Dosya bulunamadı: {SERVICE_ACCOUNT_KEY}")
            print(f"   Mevcut dizin: {os.getcwd()}")
            print(f"   Dosyalar: {os.listdir('scripts') if os.path.exists('scripts') else 'scripts klasörü yok'}")
            sys.exit(1)
        
        # JSON valid mi kontrol et
        with open(SERVICE_ACCOUNT_KEY, 'r') as f:
            json.load(f)
        
        # Firebase initialize et
        try:
            # App zaten var mı kontrol et
            app = firebase_admin.get_app()
            print("✓ Firebase app zaten initialized")
        except ValueError:
            # App henüz initialize edilmemiş - şimdi initialize et
            cred = credentials.Certificate(SERVICE_ACCOUNT_KEY)
            firebase_admin.initialize_app(cred)
            print("✓ Firebase app initialized")
        
        return firestore.client()
    except Exception as e:
        print(f"❌ Firebase initialization başarısız: {e}")
        print(f"   Dosya: {SERVICE_ACCOUNT_KEY}")
        print(f"   Dizin: {os.getcwd()}")
        sys.exit(1)

def add_drivers(db):
    """Örnek şoför verilerini Firestore'a ekle"""
    print("\n📝 Şoförler ekleniyor...")
    
    drivers = [
        {
            'name': 'Ahmet Yılmaz',
            'phone': '5301234567',  # Gerçek sistemde şifreli olacak
            'home_location': 'Konyaaltı',
            'home_latitude': 36.8891,
            'home_longitude': 30.6948,
            'license_number': 'ABC123456',
            'monthly_hours_worked': 180,
            'monthly_km': 2450,
            'non_revenue_count': 2,
            'equity_score': 87.3,
            'created_at': datetime.now(),
        },
        {
            'name': 'Mehmet Koç',
            'phone': '5309876543',
            'home_location': 'Muratpaşa',
            'home_latitude': 36.8530,
            'home_longitude': 30.7150,
            'license_number': 'DEF789012',
            'monthly_hours_worked': 160,
            'monthly_km': 2100,
            'non_revenue_count': 1,
            'equity_score': 82.1,
            'created_at': datetime.now(),
        },
        {
            'name': 'Can Yelkovan',
            'phone': '5325551234',
            'home_location': 'Kepez',
            'home_latitude': 36.9050,
            'home_longitude': 30.7330,
            'license_number': 'GHI345678',
            'monthly_hours_worked': 200,
            'monthly_km': 2800,
            'non_revenue_count': 3,
            'equity_score': 91.5,
            'created_at': datetime.now(),
        },
    ]
    
    for i, driver in enumerate(drivers, 1):
        driver_id = f'driver_{i:03d}'
        db.collection('drivers').document(driver_id).set(driver)
        print(f"  ✓ {driver['name']} (ID: {driver_id})")
    
    print(f"✅ {len(drivers)} şoför eklendi")

def add_vehicles(db):
    """Örnek araç verilerini Firestore'a ekle"""
    print("\n🚗 Araçlar ekleniyor...")
    
    vehicles = [
        {
            'plate': '308',
            'brand_model': 'Mercedes Vito',
            'status': 'active',
            'current_driver': 'driver_001',
            'daily_job_count': 0,
            'monthly_hours_worked': 180,
            'monthly_km': 2450,
            'last_maintenance_date': datetime.now(),
            'last_maintenance_km': 45000,
            'next_maintenance_km': 50000,
        },
        {
            'plate': '309',
            'brand_model': 'Mercedes Vito',
            'status': 'active',
            'current_driver': 'driver_002',
            'daily_job_count': 0,
            'monthly_hours_worked': 160,
            'monthly_km': 2100,
            'last_maintenance_date': datetime.now(),
            'last_maintenance_km': 42000,
            'next_maintenance_km': 50000,
        },
        {
            'plate': '310',
            'brand_model': 'Mercedes Vito',
            'status': 'maintenance',
            'current_driver': None,
            'daily_job_count': 0,
            'monthly_hours_worked': 200,
            'monthly_km': 2800,
            'last_maintenance_date': datetime.now(),
            'last_maintenance_km': 48000,
            'next_maintenance_km': 50000,
        },
    ]
    
    for vehicle in vehicles:
        vehicle_id = vehicle['plate']
        db.collection('vehicles_collection').document(vehicle_id).set(vehicle)
        print(f"  ✓ {vehicle['plate']} - {vehicle['brand_model']} ({vehicle['status']})")
    
    print(f"✅ {len(vehicles)} araç eklendi")

def add_transfers(db):
    """Örnek transfer verilerini Firestore'a ekle"""
    print("\n📋 Transferler ekleniyor...")
    
    transfers = [
        {
            'date': datetime.now(),
            'time_start': '10:00',
            'time_end': '11:00',
            'location_from': 'AYT_T1',
            'location_to': 'BELEK',
            'vehicle_id': '308',
            'driver_id': 'driver_001',
            'passenger_code': 'CODE_2026_001',
            'flight_number': 'TK2415',
            'flight_type': 'domestic',
            'is_revenue': True,
            'estimated_km': 50,
            'status': 'pending',
            'notes': 'VIP transfer - 3 passengers',
            'created_at': datetime.now(),
        },
        {
            'date': datetime.now(),
            'time_start': '14:30',
            'time_end': '15:30',
            'location_from': 'BELEK',
            'location_to': 'AYT_T2',
            'vehicle_id': '309',
            'driver_id': 'driver_002',
            'passenger_code': 'CODE_2026_002',
            'flight_number': 'SU2148',
            'flight_type': 'international',
            'is_revenue': True,
            'estimated_km': 48,
            'status': 'pending',
            'notes': 'Regular transfer',
            'created_at': datetime.now(),
        },
        {
            'date': datetime.now(),
            'time_start': '09:00',
            'time_end': '10:00',
            'location_from': 'AYT_CIP',
            'location_to': 'KEMER',
            'vehicle_id': None,
            'driver_id': None,
            'passenger_code': 'CODE_2026_003',
            'flight_number': 'TK2417',
            'flight_type': 'domestic',
            'is_revenue': False,  # Kazançsız iş (personnel)
            'estimated_km': 65,
            'status': 'pending',
            'notes': 'Personnel transfer',
            'created_at': datetime.now(),
        },
    ]
    
    for i, transfer in enumerate(transfers, 1):
        doc_id = f'transfer_{i:03d}'
        db.collection('transfers').document(doc_id).set(transfer)
        status = transfer['status']
        vehicle = transfer['vehicle_id'] or 'Beklemede'
        print(f"  ✓ {transfer['flight_number']} ({vehicle}) - {status}")
    
    print(f"✅ {len(transfers)} transfer eklendi")

def add_users(db):
    """Admin ve maintenance kullanıcılarını Firestore'a ekle"""
    print("\n👥 Kullanıcılar ekleniyor...")
    
    users = [
        {
            'uid': 'admin_001',
            'role': 'admin',
            'name': 'Yönetici Hesabı',
            'email': 'admin@kaplanvip.com',
            'created_at': datetime.now(),
        },
        {
            'uid': 'maintenance_001',
            'role': 'maintenance',
            'name': 'Bakım Departmanı',
            'email': 'maintenance@kaplanvip.com',
            'created_at': datetime.now(),
        },
    ]
    
    for user in users:
        db.collection('users').document(user['uid']).set(user)
        print(f"  ✓ {user['name']} ({user['role']})")
    
    print(f"✅ {len(users)} kullanıcı eklendi")

def main():
    """Ana fonksiyon"""
    print("=" * 60)
    print("🔥 Firebase Initial Data Setup")
    print("=" * 60)
    
    # Firebase'i initialize et
    db = init_firebase()
    print("✅ Firebase bağlantısı başarılı")
    
    # Verileri ekle
    try:
        add_drivers(db)
        add_vehicles(db)
        add_transfers(db)
        add_users(db)
        
        print("\n" + "=" * 60)
        print("✅ Tüm veriler başarıyla Firestore'a yüklendi!")
        print("=" * 60)
        print("\n📊 Firebase Console'da kontrol et:")
        print("   https://console.firebase.google.com")
        print("   → kaplanvip-1fad8 projesi")
        print("   → Firestore Database")
        print("   → collections: drivers, vehicles_collection, transfers, users")
        
    except Exception as e:
        print(f"❌ Hata: {e}")
        sys.exit(1)

if __name__ == '__main__':
    main()
