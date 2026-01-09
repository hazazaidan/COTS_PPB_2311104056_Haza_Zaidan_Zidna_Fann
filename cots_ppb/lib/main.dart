import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'design_system/app_colors.dart';
import 'presentation/dashboard/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://sbjdppzpvbksyyihstvq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNiamRwcHpwdmJrc3l5aWhzdHZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5Mzk2ODcsImV4cCI6MjA4MzUxNTY4N30.n4Ti-9evD6tXbMY8QLlgp5_eMlLfqaxep1O84ETs0kE',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resep Masakan',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter',
      ),
      home: const DashboardPage(),
    );
  }
}
