import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaplan_vip/config/firebase_config.dart';
import 'package:kaplan_vip/config/theme.dart';
import 'package:kaplan_vip/features/operations/pages/operations_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig.initialize();
  runApp(const ProviderScope(child: KaplanVIPApp()));
}

class KaplanVIPApp extends StatelessWidget {
  const KaplanVIPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaplanVIP Transfer Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OperationsHomePage(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
