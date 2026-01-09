import 'package:flutter/material.dart';
import '../../design_system/app_colors.dart';
import '../../design_system/app_typography.dart';
import '../../design_system/app_spacing.dart';
import '../add_recipe/add_recipe_page.dart';
import '../recipe_list/recipe_list_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget card(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.caption),
          const SizedBox(height: 8),
          Text(value, style: AppTypography.title),
        ],
      ),
    );
  }

  Widget recipeItem(String title, String category) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.restaurant, size: 40),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.section),
              Text(category, style: AppTypography.caption),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Masakan'),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RecipeListPage()),
            ),
            child: const Text('Daftar Resep'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 STATISTIK
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                card('Total Resep', '15'),
                card('Sarapan', '8'),
                card('Makan Siang & Malam', '12'),
                card('Dessert', '3'),
              ],
            ),

            const SizedBox(height: 24),

            Text('Resep Terbaru', style: AppTypography.section),
            const SizedBox(height: 12),

            recipeItem('Nasi Goreng', 'Sarapan'),
            recipeItem('Ayam Bakar Madu', 'Makan Malam'),
            recipeItem('Puding Coklat', 'Dessert'),

            const SizedBox(height: 24),

            // 🔥 TOMBOL YANG HILANG
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddRecipePage(),
                  ),
                ),
                child: const Text('Tambah Resep Baru'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
