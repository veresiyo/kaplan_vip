"""
KaplanVIP Flight Status Monitor
Her 5 dakikada bir Antalya Havalimanı uçuş verilerini çeker ve Firebase'e yazar.

Gerçek entegrasyon için:
- FlightAware API: https://www.flightaware.com/commercial/flightxml/
- Aviationstack API: https://aviationstack.com/
- OpenFlights API: https://openflights.org/
"""

import os
import json
import requests
from datetime import datetime, timedelta
import time

# Firebase Admin SDK (pip install firebase-admin)
try:
    import firebase_admin
    from firebase_admin import db, credentials
except ImportError:
    print("Firebase Admin SDK kurulu değil. Yüklemek için çalıştırın: pip install firebase-admin")
    exit(1)


class FlightScraper:
    def __init__(self):
        # Firebase initialization
        self.firebase_initialized = False
        self.db_ref = None
        
    def initialize_firebase(self, credentials_path: str):
        """Firebase Realtime Database'e bağlan"""
        try:
            if not firebase_admin._apps:
                cred = credentials.Certificate(credentials_path)
                firebase_admin.initialize_app(cred, {
                    'databaseURL': 'https://kaplan-vip-project.firebaseio.com/'
                })
            self.db_ref = db.reference('live_flights')
            self.firebase_initialized = True
            print("✓ Firebase bağlantısı başarılı")
        except Exception as e:
            print(f"✗ Firebase bağlantı hatası: {e}")
            return False
        return True

    def fetch_flight_data(self) -> dict:
        """
        Uçuş verilerini çek (simüle edilmiş veri)
        
        Gerçek entegrasyon için Flight API kullan:
        - endpoint: https://api.flightaware.com/aeroapi/flights
        - headers: {"x-apikey": "YOUR_API_KEY"}
        - params: {"airline": "TK", "destination": "GNY"}
        """
        
        # SIMÜLE VERI (Gerçek API'dan çekilecek)
        now = datetime.now()
        flights_data = {
            "TK2415": {
                "status": "on_time",          # "on_time" | "delayed" | "landed" | "cancelled"
                "scheduled_time": "10:00",
                "estimated_time": "10:00",
                "terminal": "T1",
                "aircraft": "A320",
                "origin": "IST",
                "last_updated": now.isoformat()
            },
            "SU2148": {
                "status": "delayed",          # Rötar simülasyonu
                "scheduled_time": "07:10",
                "estimated_time": "07:45",   # 35 dakika rötar
                "terminal": "T2",
                "aircraft": "B737",
                "origin": "MKE",
                "last_updated": now.isoformat()
            },
            "PC862": {
                "status": "landed",
                "scheduled_time": "09:30",
                "estimated_time": "09:28",
                "terminal": "T1",
                "aircraft": "A330",
                "origin": "TUN",
                "last_updated": now.isoformat()
            },
            "XQ451": {
                "status": "on_time",
                "scheduled_time": "14:15",
                "estimated_time": "14:15",
                "terminal": "CIP",
                "aircraft": "A380",
                "origin": "CDG",
                "last_updated": now.isoformat()
            },
        }
        
        return flights_data

    def update_firebase(self):
        """Firebase Realtime Database'e uçuş verilerini yaz"""
        if not self.firebase_initialized:
            print("✗ Firebase başlatılmadı. Önce initialize_firebase() çağrı yapın.")
            return False
        
        try:
            flights = self.fetch_flight_data()
            self.db_ref.set(flights)
            
            print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✓ Firebase güncellendi")
            print(f"   Uçuş sayısı: {len(flights)}")
            
            for flight_number, data in flights.items():
                status_symbol = "→" if data['status'] == "on_time" else "⚠" if data['status'] == "delayed" else "✓"
                print(f"   {status_symbol} {flight_number}: {data['status']} - Terminal {data['terminal']}")
            
            return True
        except Exception as e:
            print(f"✗ Firebase güncellemesi hatası: {e}")
            return False

    def run_continuous(self, interval_seconds: int = 300):
        """
        Sürekli çalışan mod (Production için)
        
        Args:
            interval_seconds: Güncelleme aralığı (varsayılan: 300 sn = 5 dakika)
        """
        print(f"KaplanVIP Flight Monitor başlatıldı (Güncelleme aralığı: {interval_seconds}s)")
        print("Çıkmak için: Ctrl+C\n")
        
        try:
            while True:
                self.update_firebase()
                print(f"Sonraki güncelleme: {interval_seconds} saniye sonra...\n")
                time.sleep(interval_seconds)
        except KeyboardInterrupt:
            print("\n✓ Flight Monitor durduruldu")

    def run_once(self):
        """Tek seferde çalış (Test için)"""
        self.update_firebase()


def main():
    # Firebase credentials path
    # Gerçek projede bu dosyayı secure bir yere koy
    credentials_path = os.getenv('FIREBASE_CREDENTIALS', 'serviceAccountKey.json')
    
    # Scraper başlat
    scraper = FlightScraper()
    
    if not scraper.initialize_firebase(credentials_path):
        print("Firebase initialize edilemedi. Devam ettirilemiyor.")
        return
    
    # Mod seçimi
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == '--once':
        print("Tek seferde çalıştırılıyor...")
        scraper.run_once()
    else:
        print("Sürekli mod başlatılıyor...")
        scraper.run_continuous(interval_seconds=300)  # Her 5 dakikada bir


if __name__ == "__main__":
    main()
