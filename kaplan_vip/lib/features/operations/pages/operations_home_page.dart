import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaplan_vip/config/theme.dart';
import 'package:kaplan_vip/providers/providers.dart';

class OperationsHomePage extends ConsumerWidget {
  const OperationsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesStream = ref.watch(vehiclesStreamProvider);
    final transfersAsync = ref.watch(todayTransfersProvider);
    final flightsStream = ref.watch(flightsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KaplanVIP Operations'),
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                DateTime.now().toString().split(' ')[0],
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: AppTheme.primaryColor,
                unselectedLabelColor: AppTheme.textSecondary,
                indicatorColor: AppTheme.primaryColor,
                tabs: const [
                  Tab(icon: Icon(Icons.map), text: 'Harita'),
                  Tab(icon: Icon(Icons.list), text: 'İşler'),
                  Tab(icon: Icon(Icons.warning), text: 'Uyarılar'),
                  Tab(icon: Icon(Icons.lightbulb), text: 'Öneriler'),
                ],
              ),
            ),
            // Tab Views
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Live Map
                  _buildMapTab(context, vehiclesStream),

                  // Tab 2: Transfers List
                  _buildTransfersTab(context, transfersAsync),

                  // Tab 3: Alerts
                  _buildAlertsTab(context, flightsStream),

                  // Tab 4: Suggestions
                  _buildSuggestionsTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapTab(BuildContext context, AsyncValue<Map<String, dynamic>> vehiclesStream) {
    return vehiclesStream.when(
      data: (vehicles) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map, size: 64, color: AppTheme.primaryColor),
            const SizedBox(height: 16),
            const Text('Flutter Map - Şoför Konumları'),
            const SizedBox(height: 8),
            Text('${vehicles.length} araç takip ediliyor'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Harita entegrasyonu yakında...')));
              },
              child: const Text('Haritayı Aç'),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Hata: $err')),
    );
  }

  Widget _buildTransfersTab(BuildContext context, AsyncValue<List> transfersAsync) {
    return transfersAsync.when(
      data: (transfers) => transfers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.inbox, size: 64, color: AppTheme.textSecondary),
                  const SizedBox(height: 16),
                  const Text('Bugün iş yok'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: transfers.length,
              itemBuilder: (context, index) {
                final transfer = transfers[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.directions_car, color: AppTheme.primaryColor),
                    title: Text('${transfer.locationFrom} → ${transfer.locationTo}'),
                    subtitle: Text('${transfer.timeStart} - ${transfer.timeEnd}'),
                    trailing: Chip(
                      label: Text(transfer.status),
                      backgroundColor: transfer.status == 'completed'
                          ? AppTheme.successColor
                          : AppTheme.warningColor,
                      labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('İş Detayı: ${transfer.id}')));
                    },
                  ),
                );
              },
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Hata: $err')),
    );
  }

  Widget _buildAlertsTab(BuildContext context, AsyncValue<Map<String, dynamic>> flightsStream) {
    return flightsStream.when(
      data: (flights) => flights.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, size: 64, color: AppTheme.successColor),
                  const SizedBox(height: 16),
                  const Text('Kritik uyarı yok'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final entries = flights.entries.toList();
                final flight = entries[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  color: flight.value['status'] == 'delayed'
                      ? AppTheme.errorColor.withValues(alpha: 0.1)
                      : Colors.white,
                  child: ListTile(
                    leading: Icon(
                      flight.value['status'] == 'delayed' ? Icons.warning : Icons.check_circle,
                      color: flight.value['status'] == 'delayed'
                          ? AppTheme.errorColor
                          : AppTheme.successColor,
                    ),
                    title: Text(flight.key),
                    subtitle: Text(
                      'Terminal: ${flight.value['terminal']} - ${flight.value['estimated_time']}',
                    ),
                    trailing: Chip(
                      label: Text(flight.value['status']),
                      backgroundColor: flight.value['status'] == 'delayed'
                          ? AppTheme.errorColor
                          : AppTheme.successColor,
                      labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                );
              },
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Hata: $err')),
    );
  }

  Widget _buildSuggestionsTab(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lightbulb, size: 64, color: AppTheme.accentColor),
          const SizedBox(height: 16),
          const Text('Sistem Önerileri'),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Yeni bir iş atamak için operasyon ekranından bir transfer seçin',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
